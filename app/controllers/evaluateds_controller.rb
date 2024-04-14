class EvaluatedsController < ApplicationController
  def fill_data
    @instrument_application = InstrumentApplication.find_by(token: params[:token])
  end

  def start_instrument
    instrument_application = InstrumentApplication.find_by(token: params[:token])
    instrument_application.update(evaluated_params)
    redirect_to instrument_path(instrument_application.instrument)
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :email, :cpf, :birth_date)
  end
end

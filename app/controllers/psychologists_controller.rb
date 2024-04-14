class PsychologistsController < ApplicationController
  def create_evaluated
    evaluated = current_psychologist.evaluateds.create(evaluated_params)
    redirect_to psychologist_evaluated_path(current_psychologist, evaluated)
  end

  def show_evaluated
    @evaluated = current_psychologist.evaluateds.find(params[:id])
  end

  def apply_instrument
    evaluated = current_psychologist.evaluateds.find(params[:evaluated_id])
    instrument = current_psychologist.instruments.find(params[:instrument_id])
    InstrumentApplication.create(evaluated: evaluated, instrument: instrument)
    InstrumentMailer.instrument_email(evaluated, instrument).deliver_now
    redirect_to psychologist_evaluated_path(current_psychologist, evaluated)
  end

  def show_instrument_result
    @instrument_application = InstrumentApplication.find(params[:id])
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birth_date)
  end
end

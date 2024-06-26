class PsychologistsController < ApplicationController
  def create_evaluated
    evaluated = current_psychologist.evaluateds.build(evaluated_params)
    if evaluated.save
      redirect_to psychologist_evaluated_path(current_psychologist, evaluated)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show_evaluated
    @evaluated = current_psychologist.evaluateds.find(params[:id])
  end

  def apply_instrument
    evaluated = current_psychologist.evaluateds.find(params[:evaluated_id])
    instrument = Instrument.find(params[:instrument_id])
    instrument_application = evaluated.instrument_applications.build(instrument: instrument)
    if instrument_application.save
      InstrumentMailer.instrument_email(instrument_application).deliver_now
      redirect_to psychologist_evaluated_path(current_psychologist, evaluated), notice: 'Instrument applied successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show_instrument_result
    @instrument_application = InstrumentApplication.find(params[:id])
    render 'show_evaluated'
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birth_date)
  end
end

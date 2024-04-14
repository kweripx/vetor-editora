class InstrumentsController < ApplicationController
  def show
    @instrument = Instrument.find(params[:id])
  end

  def submit_answers
    instrument_application = InstrumentApplication.find(params[:instrument_application_id])
    score = calculate_score(params[:answers])
    if instrument_application.update(score: score, status: 'finished')
      head :ok
    else
      render json: instrument_application.errors, status: :unprocessable_entity
    end
  end

  private

  def calculate_score(answers)
    answers.sum { |answer| 4 - answer.to_i }
  end
end

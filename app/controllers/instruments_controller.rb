class InstrumentsController < ApplicationController
  def show
    @instrument = Instrument.find(params[:id])
  end

  def submit_answers
    instrument_application = InstrumentApplication.find(params[:instrument_application_id])
    score = calculate_score(params[:answers])
    instrument_application.update(score: score, status: 'finished')
  end

  private

  def calculate_score(answers)
    score = 0
    answers.each do |answer|
      case answer
      when '1'
        score += 3
      when '2'
        score += 2
      when '3'
        score += 1
      end
    end
    score
  end
end

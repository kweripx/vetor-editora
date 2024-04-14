class InstrumentMailer < ApplicationMailer
  def instrument_email(evaluated, instrument)
    @evaluated = evaluated
    @instrument = instrument
    @instrument_application = InstrumentApplication.find_by(evaluated: @evaluated, instrument: @instrument)
    mail(to: @evaluated.email, subject: 'Novo instrumento psicológico disponível')
  end
end

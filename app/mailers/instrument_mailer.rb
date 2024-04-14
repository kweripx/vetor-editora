class InstrumentMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def instrument_email(instrument_application)
    @instrument_application = instrument_application
    @evaluated = instrument_application.evaluated
    @instrument = instrument_application.instrument

    mail(to: @evaluated.email, subject: 'Novo instrumento psicológico disponível')
  end
end

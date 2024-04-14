require 'rails_helper'

RSpec.describe InstrumentMailer, type: :mailer do
  describe '#instrument_email' do
    let(:psychologist) { create(:psychologist) }
    let(:instrument) { create(:instrument, psychologist: psychologist) }
    let(:evaluated) { create(:evaluated, psychologist: psychologist) }
    let(:instrument_application) { create(:instrument_application, evaluated: evaluated, instrument: instrument) }
    let(:mail) { InstrumentMailer.instrument_email(instrument_application) }

    before do
      instrument_application  # Ensure the application is set up correctly
    end

    it 'renders the headers' do
      expect(mail.subject).to eq('Novo instrumento psicológico disponível')
      expect(mail.to).to eq([evaluated.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(instrument.name)
    end

    it 'delivers the email' do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end

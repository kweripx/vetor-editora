require 'rails_helper'

RSpec.describe InstrumentApplication, type: :model do
  it "belongs to an evaluated" do
    evaluated = Evaluated.create(name: 'Evaluated 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    application = evaluated.instrument_applications.create

    expect(application.evaluated).to eq(evaluated)
  end

  it "belongs to an instrument" do
    instrument = Instrument.create(name: 'Instrument 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    application = instrument.instrument_applications.create

    expect(application.instrument).to eq(instrument)
  end
end

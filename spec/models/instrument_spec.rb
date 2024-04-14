require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it "belongs to a psychologist" do
    psychologist = Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    instrument = psychologist.instruments.create(name: 'Instrument 1')

    expect(instrument.psychologist).to eq(psychologist)
  end

  it "has many instrument applications" do
    instrument = Instrument.create(name: 'Instrument 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    application1 = instrument.instrument_applications.create
    application2 = instrument.instrument_applications.create

    expect(instrument.instrument_applications).to include(application1)
    expect(instrument.instrument_applications).to include(application2)
  end

  it "has many evaluateds through instrument applications" do
    instrument = Instrument.create(name: 'Instrument 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    evaluated1 = Evaluated.create(name: 'Evaluated 1', psychologist: instrument.psychologist)
    evaluated2 = Evaluated.create(name: 'Evaluated 2', psychologist: instrument.psychologist)
    instrument.instrument_applications.create(evaluated: evaluated1)
    instrument.instrument_applications.create(evaluated: evaluated2)

    expect(instrument.evaluateds).to include(evaluated1)
    expect(instrument.evaluateds).to include(evaluated2)
  end
end

require 'rails_helper'

RSpec.describe Evaluated, type: :model do
  it "belongs to a psychologist" do
    psychologist = Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    evaluated = psychologist.evaluateds.create(name: 'Evaluated 1')

    expect(evaluated.psychologist).to eq(psychologist)
  end

  it "has many instrument applications" do
    evaluated = Evaluated.create(name: 'Evaluated 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    application1 = evaluated.instrument_applications.create
    application2 = evaluated.instrument_applications.create

    expect(evaluated.instrument_applications).to include(application1)
    expect(evaluated.instrument_applications).to include(application2)
  end

  it "has many instruments through instrument applications" do
    evaluated = Evaluated.create(name: 'Evaluated 1', psychologist: Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password'))
    instrument1 = Instrument.create(name: 'Instrument 1', psychologist: evaluated.psychologist)
    instrument2 = Instrument.create(name: 'Instrument 2', psychologist: evaluated.psychologist)
    evaluated.instrument_applications.create(instrument: instrument1)
    evaluated.instrument_applications.create(instrument: instrument2)

    expect(evaluated.instruments).to include(instrument1)
    expect(evaluated.instruments).to include(instrument2)
  end
end

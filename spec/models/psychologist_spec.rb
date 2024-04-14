require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  it "has many evaluateds" do
    psychologist = Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    evaluated1 = psychologist.evaluateds.create(name: 'Evaluated 1')
    evaluated2 = psychologist.evaluateds.create(name: 'Evaluated 2')

    expect(psychologist.evaluateds).to include(evaluated1)
    expect(psychologist.evaluateds).to include(evaluated2)
  end

  it "has many instruments" do
    psychologist = Psychologist.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    instrument1 = psychologist.instruments.create(name: 'Instrument 1')
    instrument2 = psychologist.instruments.create(name: 'Instrument 2')

    expect(psychologist.instruments).to include(instrument1)
    expect(psychologist.instruments).to include(instrument2)
  end
end

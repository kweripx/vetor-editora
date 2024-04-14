FactoryBot.define do
  factory :instrument_application do
    evaluated
    instrument
    token { SecureRandom.uuid }
  end
end

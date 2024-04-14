FactoryBot.define do
factory :instrument_application do
  evaluated { create(:evaluated) }
  instrument { create(:instrument) }
  token { SecureRandom.uuid }
  end
end

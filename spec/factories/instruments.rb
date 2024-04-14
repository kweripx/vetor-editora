FactoryBot.define do
  factory :instrument do
    name { 'Instrument' }
    psychologist { create(:psychologist) }
  end
end

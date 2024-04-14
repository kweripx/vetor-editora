FactoryBot.define do
  factory :evaluated do
    name { 'Evaluated User' }
    email { 'evaluated@example.com' }
    cpf { '123.456.789-00' }
    birth_date { '2000-01-01' }
    psychologist { create(:psychologist) }
  end
end

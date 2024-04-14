class Psychologist < ApplicationRecord
  has_secure_password
  has_many :evaluateds
  has_many :instruments
end

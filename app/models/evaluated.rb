class Evaluated < ApplicationRecord
  belongs_to :psychologist
  has_many :instrument_applications
  has_many :instruments, through: :instrument_applications
end

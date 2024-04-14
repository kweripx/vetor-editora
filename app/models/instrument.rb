class Instrument < ApplicationRecord
  belongs_to :psychologist
  has_many :instrument_applications
  has_many :evaluateds, through: :instrument_applications
end

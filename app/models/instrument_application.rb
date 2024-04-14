class InstrumentApplication < ApplicationRecord
  belongs_to :evaluated
  belongs_to :instrument
end

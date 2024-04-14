class CreateInstrumentApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :instrument_applications do |t|

      t.timestamps
    end
  end
end

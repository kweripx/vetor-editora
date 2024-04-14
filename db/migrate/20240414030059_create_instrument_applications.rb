class CreateInstrumentApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :instrument_applications do |t|
      t.references :evaluated, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true
      t.integer :score
      t.string :status

      t.timestamps
    end
  end
end

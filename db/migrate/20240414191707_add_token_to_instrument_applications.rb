class AddTokenToInstrumentApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :instrument_applications, :token, :string
    add_index :instrument_applications, :token, unique: true
  end
end

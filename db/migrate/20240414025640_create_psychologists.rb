class CreatePsychologists < ActiveRecord::Migration[7.1]
  def change
    create_table :psychologists do |t|

      t.timestamps
    end
  end
end

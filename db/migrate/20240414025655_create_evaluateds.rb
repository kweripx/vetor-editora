class CreateEvaluateds < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluateds do |t|

      t.timestamps
    end
  end
end

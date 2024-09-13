class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.float :marks
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

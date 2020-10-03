class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.references :fluck, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

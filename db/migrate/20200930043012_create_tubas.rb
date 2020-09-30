class CreateTubas < ActiveRecord::Migration[6.0]
  def change
    create_table :tubas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fluck, null: false, foreign_key: true
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_index :tubas, [:user_id, :fluck_id], unique: true
  end
end

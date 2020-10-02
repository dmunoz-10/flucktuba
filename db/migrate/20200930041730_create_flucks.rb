class CreateFlucks < ActiveRecord::Migration[6.0]
  def change
    create_table :flucks do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :description

      t.timestamps
    end

    add_index :flucks, :nickname, unique: true
  end
end

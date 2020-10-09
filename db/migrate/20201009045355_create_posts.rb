class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fluck, null: false, foreign_key: true
      t.integer :type, null: false
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end

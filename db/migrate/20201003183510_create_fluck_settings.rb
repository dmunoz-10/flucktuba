class CreateFluckSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :fluck_settings do |t|
      t.references :fluck, null: false, foreign_key: true
      t.integer :banner_size, null: false, default: 0
      t.integer :image_shape, null: false, default: 0
      t.string :primary_color, null: false, default: '#4a86e8'
      t.string :text_color, null: false, default: '#ffffff'
      t.string :tuba_name, null: false, default: 'tuba'

      t.timestamps
    end
  end
end

class CreateFluckSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :fluck_settings do |t|
      t.references :fluck, null: false, foreign_key: true
      t.integer :banner_size, null: false, default: 0
      t.string :border_image_color, null: false, default: 'white'
      t.string :primary_color, null: false, default: '#4a86e8'

      t.timestamps
    end
  end
end

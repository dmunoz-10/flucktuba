class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :color_theme, null: false, default: 0
      t.string :primary_color, null: false, default: '#4a86e8'

      t.timestamps
    end
  end
end

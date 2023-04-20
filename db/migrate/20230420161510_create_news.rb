class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :slug
      t.string :language, array: true, default: []
      t.string :categories, array: true, default: []
      t.string :countries, array: true, default: []
      t.timestamps
    end
  end
end

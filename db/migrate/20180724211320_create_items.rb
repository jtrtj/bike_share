class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image
      t.decimal :price
      t.integer :status, default: 1
    end
  end
end

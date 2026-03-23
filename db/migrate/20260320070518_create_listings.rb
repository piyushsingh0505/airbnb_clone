class CreateListings < ActiveRecord::Migration[8.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.integer :price_cents
      t.string :price_currency
      t.decimal :rating
      t.string :image_url

      t.timestamps
    end
  end
end

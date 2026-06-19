class AddAmenitiesToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :amenities, :text
  end
end

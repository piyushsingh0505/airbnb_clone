class AddMaxGuestsToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :max_guests, :integer
  end
end

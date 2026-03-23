# Purana data delete karein
puts "Deleting old listings..."
Listing.destroy_all

cities = [ "Mumbai", "Delhi", "Bangalore", "Goa", "Udaipur", "Manali", "Jaipur", "Shimla", "Kerala", "Pune", "Hyderabad", "Chennai" ]
headlines = [ "Luxury Beachfront Villa", "Modern City Apartment", "Peaceful Mountain Cabin", "Heritage Palace Stay", "Chic Studio Loft", "Riverside Cottage", "Desert Camp Experience", "Green Valley Retreat" ]

# Images ke liye hum Unsplash ki IDs use karenge taaki photos hamesha alag rahein
# Source: https://unsplash.com/t/interiors
image_ids = [
  "1512917774080-9991f1c4c750", "1600585154340-be6199f76a0c", "1600596542815-ffad4c1539a9",
  "1499793983690-e29da59ef1c2", "1464146072230-91cabc968266", "1582268611958-ebfd161ef9cf",
  "1574362848149-11496d93a7c7", "1544984243-ec57ea16fe25", "1518780664697-55e3ad937233",
  "1590073242678-70ee3fc28e8e", "1502672260266-1c1ef2d93688", "1480074568708-e7b720bb3f09"
]

puts "Creating 50 listings..."

50.times do |i|
  Listing.create!(
    city: cities.sample, # Random city pick karega
    country: "India",
    headline: "#{headlines.sample} ##{i+1}", # Unique headline
    price_cents: rand(3000..25000) * 100, # 3000 se 25000 ke beech random price
    rating: (rand(4.0..5.0)).round(2), # 4.0 se 5.0 ke beech rating
    # Har baar image list se alag ID uthayega, agar khatam ho jaye toh repeat karega
    image_url: "https://images.unsplash.com/photo-#{image_ids[i % image_ids.length]}?auto=format&fit=crop&w=800&q=80",
    state: "India"
  )
end

puts "Success: 50 Unique Listings Created!"

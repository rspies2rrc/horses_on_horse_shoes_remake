require "open-uri"

Horse.delete_all
Breed.delete_all

NUMBER_OF_BREEDS = 4
HORSES_PER_BREED = 4

NUMBER_OF_BREEDS.times do
  breed = Breed.create(name: Faker::Creature::Horse.unique.breed)

  HORSES_PER_BREED.times do
    horse = breed.horses.create(
      name:           Faker::Creature::Horse.unique.name,
      age:            rand(3..348),
      top_speed:      3.1415926 * rand(20..56),
      number_of_legs: rand(1..14)
    )
  end
end


# Pexels gem defaults to environment variable/.env value PEXELS_API_KEY
image_client = Pexels::Client.new()

# Get 20 images from the image_client
response = image_client.photos.search('horse', page: 1, per_page: 20)

# Loop over horse table and attach an image to each entry
Horse.all.each_with_index do |horse, index|
  downloaded_image = URI.parse(response.photos[index].src["small"]).open
  horse.image.attach(io: downloaded_image, filename: "m-#{[ horse.name, horse.breed.name ].join('-')}.jpg")
end

puts "Created #{Breed.count} Breeds."
puts "Created #{Horse.count} Horses."
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

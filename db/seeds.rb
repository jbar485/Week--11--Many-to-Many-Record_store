# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Album.destroy_all
Artist.destroy_all
Song.destroy_all

15.times do |index|
  Artist.create!(name: Faker::Kpop.boy_bands)
end

p "Created #{Artist.count} artists"

25.times do |index|
  album = Album.create!(name: Faker::ElectricalComponents.active, year: Faker::Number.number(digits: 4), genre: Faker::Beer.name)
  artist = Artist.random
  album.artists << artist
end

p "Created #{Album.count} albums"


125.times do |index|
  Song.create!(name: Faker::Vehicle.manufacture, lyrics: Faker::Lorem.sentence(word_count: 3), album_id: Album.random.id)
end

p "Created #{Song.count} songs"

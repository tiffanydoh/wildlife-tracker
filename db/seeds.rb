# Data for sightings
sightings_data = [
  { date: "2024-09-06T05:48:33.068Z", latitude: 1.234, longitude: 5.678, animal_id: 1 },
  { date: "2024-09-06T05:48:42.382Z", latitude: 2.345, longitude: 6.789, animal_id: 2 },
  { date: "2024-09-06T05:48:53.335Z", latitude: 3.456, longitude: 7.89, animal_id: 3 },
  { date: "2024-09-06T05:49:00.211Z", latitude: 4.567, longitude: 8.901, animal_id: 4 },
  { date: "2024-09-06T05:49:07.159Z", latitude: 5.678, longitude: 9.012, animal_id: 5 },
  { date: "2024-08-27T05:50:13.827Z", latitude: 3.456, longitude: 7.89, animal_id: 3 },
  { date: "2024-09-01T05:50:27.689Z", latitude: 3.456, longitude: 7.89, animal_id: 3 },
  { date: "2024-09-03T05:50:40.413Z", latitude: 3.456, longitude: 7.89, animal_id: 3 },
  { date: "2024-09-05T05:50:53.757Z", latitude: 3.456, longitude: 7.89, animal_id: 3 }
]

# Create sightings
sightings_data.each do |sighting_data|
  Sighting.create!(sighting_data)
end

# Data for animals
animals_data = [
  { common_name: "African Elephant", latin_name: "Loxodonta africana", kingdom: "Animalia" },
  { common_name: "Bald Eagle", latin_name: "Haliaeetus leucocephalus", kingdom: "Animalia" },
  { common_name: "Bengal Tiger", latin_name: "Panthera tigris tigris", kingdom: "Animalia" },
  { common_name: "Monarch Butterfly", latin_name: "Danaus plexippus", kingdom: "Animalia" },
  { common_name: "Clownfish", latin_name: "Amphiprion percula", kingdom: "Animalia" }
]

# Create animals
animals_data.each do |animal_data|
  Animal.create!(animal_data)
end


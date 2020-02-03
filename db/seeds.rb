puts "Start seeds"
Organisation.destroy_all

user = User.first

Organisation.create!(
  name: "Hotel 1",
  user: user,

  presentation: "Ceci est la présentation de l'hotel",
  facebook_link: "facebook-123",
  tripadvisor_link: "trip-456",
  google_link: "google-789",
  yelp_link: "yelp-159"
)

puts "#{Organisation.count} organisations created."
puts "End of seeds"

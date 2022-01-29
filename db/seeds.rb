puts 'Deleting all bookings'
Booking.destroy_all
puts "Done"
puts 'Deleting all reviews ... '
Review.destroy_all
puts 'Deleting all users ...'
User.destroy_all
puts 'Creating test user ...'
User.create(email: 'cae@gmail.com', password: '1234567', first_name: 'Camille', last_name: 'Exantus')
User.create(email: 'fun@yahoo.co.jp', password: 'qwerty09', first_name: 'Mao', last_name: 'Hasegawa')
puts 'Done'


puts 'Deleting all dresses'
Dress.destroy_all
puts "Done"
puts 'Creating dresses ...'
Dress.create(
  brand: 'Versace',
  color: 'White',
  size: 2,
  style: 'Mermaid',
  description: 'Magestic and feminine.',
  price_per_day: 1000,
  user_id: User.first.id,
  location: 'Shinjuku'
)
Dress.create(
  brand: 'Gucci',
  color: 'White',
  size: 2,
  style: 'Princess',
  description: 'Elegant with pearl detailing.',
  price_per_day: 1030,
  user_id: User.first.id,
  location: 'Nakameguro',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156854/gucci_princess_foofpj.jpg'
)
Dress.create(
  brand: 'Armani',
  color: 'Cream',
  size: 4,
  style: 'Trumpet',
  description: 'Classic. A statement piece. Looks great in photos.',
  price_per_day: 512,
  user_id: User.first.id,
  location: 'Shibuya',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156853/armani_cream_cgib1e.jpg'
)
Dress.create(
  brand: 'Gucci',
  color: 'White',
  size: 6,
  style: 'Empire',
  description: 'Very comfortable and elegant. Small stain on the hem but barely noticable',
  price_per_day: 600,
  user_id: User.first.id,
  location: 'Akihabara',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156854/gucci_white_empire_lpfkad.jpg'
)
Dress.create(
  brand: 'Vera Wang',
  color: 'Baby Blue',
  size: 10,
  style: 'Ballgown',
  description: 'Poofy and feminine. Big impact!',
  price_per_day: 365,
  user_id: User.first.id,
  location: 'Shinjuku Sanchome',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156855/vera_wang_baby_blue_x3uirc.jpg'
)
Dress.create(
  brand: 'Vera Wang',
  color: 'Gold',
  size: 8,
  style: 'A-Line',
  description: 'So glamorous and sexy. For a bride who wants to show off her figure!',
  price_per_day: 300,
  user_id: User.first.id,
  location: 'Ebisu',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156854/vera_wang_gold_y9aeig.jpg'
)
Dress.create(
  brand: 'Phillipa Lepley',
  color: 'Silver',
  size: 27,
  style: 'Princess',
  description: 'Girly and playful, great silhouette',
  price_per_day: 300,
  user_id: User.first.id,
  location: 'Tokyo Tower',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156854/phillipa_lepley_silver_v4as3y.jpg'
)
Dress.create(
  brand: 'Jenny Packham',
  color: 'Champagne',
  size: 12,
  style: 'Bateau',
  description: 'Modern twist on a classic dress. Simply gorgeous.',
  price_per_day: 325,
  user_id: User.first.id,
  location: 'Meguro',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156853/Jenny_Packham_champagne_inh3tz.jpg'
)
Dress.create(
  brand: 'Hermione',
  color: 'Baby Pink',
  size: 8,
  style: 'A-Line',
  description: 'Adorable yet sophisticated. An extremely pale pink, unique dress.',
  price_per_day: 250,
  user_id: User.first.id,
  location: 'Daikanyama',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156853/Hermione_baby_pink_a-line_laboem.jpg'
)
Dress.create(
  brand: 'Vivienne Westwood',
  color: 'Gold',
  size: 10,
  style: 'Column',
  description: 'Very simple and understated. Goes well with diamonds.',
  price_per_day: 200,
  user_id: User.first.id,
  location: 'Yutenji',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156855/vivienne_westwood_gold_sn7vck.jpg'
)
Dress.create(
  brand: 'Vera Wang',
  color: 'Gold',
  size: 8,
  style: 'A-Line',
  description: 'Urban chic wedding dress, great for city weddings!',
  price_per_day: 500,
  user_id: User.first.id,
  location: 'Harajuku',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156855/vera_wang_gold_a-line_bybias.jpg'
)
Dress.create(
  brand: 'Tony Ward',
  color: 'White',
  size: 23,
  style: 'Mermaid',
  description: 'Small and elegant dress - for a petite bride.',
  price_per_day: 235,
  user_id: User.first.id,
  location: 'Omotesando',
  dress_url: 'https://res.cloudinary.com/dailyusername/image/upload/v1643156854/tony_ward_white_mermaid_rdjsfd.jpg'
)
puts 'Done!'

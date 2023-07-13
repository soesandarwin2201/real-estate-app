user = User.create!(
  name: 'dory',
  username: 'dory',
  email: 'dory2023@gmail.com',
  password: 'koko23052020',
  address: 'mandalay,myanmar',
  details: 'this is the test for the phone',
  company_name: 'soe software service'
)

user_phone = Phone.create!(number: '09783307421', user_id: user.id)
user.avatar.attach(io: File.open(Rails.root.join('db/images/new.png')), filename: 'new.png')

# user_house = House.create!(
#   name: 'house 1',
#   bathroom: 2,
#   bedroom: 3,
#   address: 'test house address',
#   home_status: 'for rent',
#   home_type: 'condo',
#   advertise: true,
#   price: 200000,
#   desc: 'this is the test for the house owner',
#   square: 500,
#   zone: 'patheingyi',
#   floor: 2,
#   tv: true,
#   bacon: true,
#   ac: true,
#   user_id: user.id
# )

# image = user_house.images.attach(
#   io: File.open(Rails.root.join('db/images/new.png')),
#   filename: 'new.png'
# )

# # Check if the image was successfully attached before saving the house
# if images.present?
#   user_house.save!
# else
#   puts 'Failed to attach the image to the house.'
# end


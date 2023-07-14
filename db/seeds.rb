user = User.create!(
  name: 'nemo father',
  username: 'nemo father',
  email: 'nemofather2003@gmail.com',
  password: 'koko23052020',
  address: 'mandalay,myanmar',
  details: 'this is the test for the phone',
  company_name: 'soe software service'
)

user_phone = Phone.create!(number: '09783307421', user_id: user.id)
user_phone_2 = Phone.create!(number: '09454940293', user_id: user.id)
user.avatar.attach(io: File.open(Rails.root.join('db/images/new.png')), filename: 'new.png')




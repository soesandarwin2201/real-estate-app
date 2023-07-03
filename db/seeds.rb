user = User.create!(
  name: 'pinterest',
  username: 'pinterest',
  email: 'pinterest2201@gmail.com',
  password: 'koko23052020',
  address: 'mandalay,myanmar',
  details: 'this is the test for the phone',
  company_name: 'soe software service'
);

user_phone = Phone.create!(number: '09425494314', user_id: user.id);


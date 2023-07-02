user = User.create!(
  name: 'soe moe naing ',
  username: 'dede',
  email: 'soemoenaing2201@gmail.com',
  password: 'koko23052020',
  address: 'mandalay,myanmar',
  details: 'this is the test for the phone',
  company_name: 'soe software service'
);

user_phone = Phone.create!(number: '09425494314', user_id: user.id);


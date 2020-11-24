
Student.delete_all
Tutor.delete_all
User.delete_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'Testing123',
    role: 'student'
  )

  user.save

  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: user
  )
end

10.times do
  tutor = User.create(
    email: Faker::Internet.email,
    password: 'Testing123',
    role: 'tutor'
  )

  tutor.save

  Tutor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: tutor
  )

end

admin = User.new(
  email: 'jamieson.reinhard2@gmail.com',
  password: 'Testing123',
  role: 'admin'
)

admin.save

10.times do
  partner = Partner.create(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase
  )
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.delete_all
Tutor.delete_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456',
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
    password: '123456',
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
  password: '123456',
  role: 'admin'
)

admin.save
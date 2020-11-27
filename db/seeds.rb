Appointment.delete_all
Partner.delete_all
Student.delete_all
Tutor.delete_all
User.delete_all

def rand_date
  # return a random date within 100 days of today in both past and future directions.
  n = rand(1..50)
  Date.today.advance(days: n)
end

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
    user: user,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'USA',
    school: "#{Faker::Movies::HarryPotter.house} High School"
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
    user: tutor,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'USA',
    occupation: Faker::Job.title,
    phone_number: Faker::PhoneNumber.cell_phone,
    linked_in_link: 'linkedin.com/in/myname',
    summary: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
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

40.times do
  Appointment.create(
    date: rand_date,
    tutor: Tutor.all[rand(0..9)],
    student: Student.all[rand(0..9)]
  )
end



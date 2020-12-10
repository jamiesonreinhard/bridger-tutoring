Appointment.delete_all
Partner.delete_all
Student.delete_all
Tutor.delete_all
User.delete_all

def rand_date
  n = rand(1..10)
  Date.today.advance(days: n)
end

def rand_time
  now = Time.now
  a_day_ago = now - (60 * 60 * 24)
  random_time = rand(a_day_ago..now)
  return random_time
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

20.times do
  Appointment.create(
    date: rand_date,
    tutor: Tutor.all[rand(0..9)],
    student: Student.all[rand(0..9)]
  )
end

20.times do
  Appointment.create(
    date: rand_date,
    time: rand_time,
    tutor: Tutor.all[rand(0..9)]
  )
end



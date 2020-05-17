100.times do
  Institution.create(
    name: Faker::Company.name,
    location: "#{Faker::Address.latitude}.#{Faker::Address.longitude}",
    description: "#{Faker::Company.catch_phrase}. #{Faker::Lorem.paragraph(sentence_count: 10)}",
  )
end

10000.times do
  Visitor.create(
    device_id: Faker::Device.serial,
    visit_date: Faker::Date.between(from: 365.days.ago, to: Date.today),
    institution: Institution.find(Random::rand(100) + 1)
  )
end

99.times do |i|
  password = Faker::Internet.password

  Admin.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    institution: Institution.find(i + 1)
  )
end

Admin.create(
  name: 'admin',
  email: 'dmytro.vasylenko.ua@gmail.com',
  password: 'qwe123',
  password_confirmation: 'qwe123',
  institution: Institution.find(100)
)
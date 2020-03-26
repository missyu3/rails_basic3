100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  profile = "test"
  password = "password"
  User.create!(name: name,
              email: email,
              profile: profile,
              password: password,
              password_confirmation: password
              )
end
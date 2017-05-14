100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  nutzer = User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
Blog.create(
  title: "AAA",
  content: "BBB",
  user_id: nutzer.id
  )
end


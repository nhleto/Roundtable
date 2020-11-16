# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

User.create!(name: 'henry', username: 'username', password: 'password', email: 'me@me.com', date_of_birth: '2020-01-01')

10.times do
  User.create!(name: Faker::FunnyName.unique.name, password: 'password', username: Faker::Movies::Lebowski.unique.character,
               email: Faker::Internet.unique.email, date_of_birth: Faker::Date.between(from: '1997-01-01', to: '1999-01-01'))
end

@users = User.all

@users.each_with_index do |user, i|
  user.avatar.attach(io: File.open("app/assets/images/FakeBook_Images/#{i + 1}.jpg"), filename: 'avatarpic.jpg')
  user.save
end

20.times do
  Post.create!(title: Faker::Book.unique.title, body: Faker::Lorem.unique.paragraphs, user_id: User.ids.sample)
end

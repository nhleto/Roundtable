# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Friendship.destroy_all
Membership.destroy_all
Group.destroy_all
Like.destroy_all

User.create!(name: 'henry', password: 'password', email: 'me@me.com', date_of_birth: '2020-01-01')

User.create!(name: 'sarah', password: 'password', email: 'mee@me.com', date_of_birth: '2020-01-01')

# username: Faker::Movies::LordOfTheRings.unique.character

10.times do
  User.create!(name: Faker::FunnyName.unique.name, password: 'password',
               email: Faker::Internet.unique.email, date_of_birth: Faker::Date.between(from: '1997-01-01', to: '1999-01-01'))
end

@users = User.all

# @users.each_with_index do |user, i|
#   user.avatar.attach(io: File.open("app/assets/images/FakeBook_Images/#{i + 1}.jpg"), filename: 'avatarpic.jpg')
#   user.save
# end

5.times do
  Group.create!(name: Faker::Game.unique.genre, description: Faker::Lorem.unique.paragraphs, owner_id: @users.ids.sample)
end

20.times do
  Post.create!(body: Faker::Lorem.unique.paragraphs, user_id: User.ids.sample)
end

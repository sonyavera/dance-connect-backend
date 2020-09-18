# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DanceClass.destroy_all
User.destroy_all
UserClass.destroy_all
Comment.destroy_all
Like.destroy_all

styles = ["cubansalsa", "kizomba", "bachata", "afrocubanfolklore", "newyorksalsa", "zouk"]
account_types = ["teacher", "student"]



15.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username:Faker::Internet.username, password_digest:Faker::Internet.password, account_type: account_types.sample, avatar: "http://www.manana.si/uploads/3/1/0/4/31047219/karelia_orig.jpg")
end

30.times do
    DanceClass.create(user_id: User.all.sample.id, style: styles.sample, release_date: Faker::Date.between(from: '2020-09-23', to: '2020--12-01') )
end

30.times do
    UserClass.create(dance_class_id: DanceClass.all.sample.id, user_id: User.all.sample.id)
end

50.times do
    Comment.create(user_id: User.all.sample.id, dance_class_id: DanceClass.all.sample.id, text: Faker::Movies::HarryPotter.quote)
end

100.times do
    Like.create(user_id: User.all.sample.id, comment_id: Comment.all.sample.id)
end
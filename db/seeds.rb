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
# Comment.destroy_all
# Like.destroy_all

styles = ["cubansalsa", "kizomba", "bachata", "afrocubanfolklore", "newyorksalsa", "zouk"]
account_types = ["teacher", "student"]
levels = ["Beginner", "Intermediate", "Advanced", "Open Level"]
videos =[
    "https://www.youtube.com/watch?v=uGjxUvP-s9E&feature=youtu.be&fbclid=IwAR28Hwvj-o-OsBLTohqr8hqfdFxgAYKLWMLFEVHm2dHKhc44AJirXWO_edo",
    "https://www.youtube.com/watch?v=916WA8Uvsuc",
    "https://www.youtube.com/watch?v=Rj2QBEZeyqU&feature=youtu.be,
    https://www.youtube.com/watch?v=8u6P1we3dik,
    https://www.youtube.com/watch?v=UD3KPNG-GmU"  
]
avatars = [
                "https://images.squarespace-cdn.com/content/v1/525d431fe4b0c7982004d469/1488400976979-M2PMTNV9MKDQ77TGJMA7/ke17ZwdGBToddI8pDm48kGm_lmxn_JwT7UQFYPwQ7ZxZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpwXWplLfyj2T9RmzkPfGlD5YA16S37GzO0FbXGbA1afGkmpTu4DKR10BpnFEkUNJHQ/image5.JPG?format=1500w",
                "https://static.wixstatic.com/media/aefce4_30ec11808a3b4c26a8500975e6994087~mv2_d_3505_3025_s_4_2.png/v1/fill/w_3505,h_3025,al_c/aefce4_30ec11808a3b4c26a8500975e6994087~mv2_d_3505_3025_s_4_2.png",
                "https://pbs.twimg.com/media/DIqyA49VAAAq6dc.jpg",
                "https://i.ytimg.com/vi/gVgYJlPnTuc/maxresdefault.jpg",
                "https://i0.wp.com/golatindance.com/wp-content/uploads/2020/01/ace-and-ciara-crop.png?fit=740%2C421&ssl=1",
                "https://lh3.googleusercontent.com/proxy/0n5tg1OmoFucqzSiUswMP58qd2Kxs_67M6pY8fgZMCFQvLK5NkSm4zQ9ABb4Ur3Czou6c6bvMgfZcQJXeTrcQsn2kk3V6cvIqC5Z8d6RXmUW"
            ]


descriptions = [
    "This class will be high-energy and lots of fun. See you there!",
    "We will go into detail with technique and I'll teach you about the history behind the steps.",
    "A slow paced class for those looking to perfect their movements.",
    "In this class we'll be building on to what I taught in my previous class. Purchase both for full understanding."
]

user_comments =[
    "Wow, best class ever!",
    "This was an amazing workout and I improved my technique with this class.",
    "Slow paced but very fun! I learned a lot and I'm actually pretty sore."
]



15.times do
    User.create(first_name: Faker::Name.first_name, 
                last_name: Faker::Name.last_name, 
                username:Faker::Internet.username, 
                password_digest:Faker::Internet.password, 
                account_type: account_types.sample,
                seeds_avatar: avatars.sample
            )
end

50.times do
    DanceClass.create(user_id: User.all.sample.id, 
                      style: styles.sample, 
                      level: levels.sample,
                      date: Faker::Date.between(from: '2020-09-23', to: '2020--12-01'),
                      description: descriptions.sample,
                      price: Faker::Number.between(from: 1, to: 50),
                      url: videos.sample
                     )
end

40.times do
    UserClass.create(dance_class_id: DanceClass.all.sample.id, 
                    user_id: User.all.sample.id)
end


DanceClass.all.each do |dance_class|
    10.times do
        dance_class.comments.create(body: user_comments.sample)
    end
end



#     Comment.create(user_id: User.all.sample.id, 
#                    dance_class_id: DanceClass.all.sample.id, 
#                    text: Faker::Movies::HarryPotter.quote)
# end

# 100.times do
#     Like.create(user_id: User.all.sample.id, 
#                comment_id: Comment.all.sample.id)
# end
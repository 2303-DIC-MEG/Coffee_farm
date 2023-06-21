require 'faker'

# ユーザーデータの投入
5.times do
  user = User.create!(
    name: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    role: User.roles.keys.sample 
  )
end

# プロフィールデータの投入
5.times do|n|
  profile = Profile.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    image:File.open("./public/images/sample.png"),
    user_id: n+1
  )
end

# ブログデータの投入
5.times do|n|
  blog = Blog.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    image:File.open("./public/images/sample.png"),
    user_id: n+1
  )
end

# お気に入りデータの投入
5.times do|n|
  puts "#{n+1}回目"
  Favorite.create!(
    user_id: n+1,
    blog_id: n+1
  )
end


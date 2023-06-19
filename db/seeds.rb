require 'faker'

# ユーザーデータの投入
5.times do
  user = User.create!(
    name: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    role: User.roles.keys.sample # ランダムな role の設定
  )

  # ブログデータの投入
  5.times do
    blog = Blog.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      content: Faker::Lorem.paragraph(sentence_count: 2),
      image:File.open("./public/images/sample.png"),
      user: user
    )
  end
end


# プロフィールデータの投入
User.all.each do |user|
  profile = Profile.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    image:File.open("./public/images/sample.png"),
    user: user
  )
end


# お気に入りデータの投入
User.all.each do |user|
  Blog.all.sample(3).each do |blog|
    user.favorites.create!(blog_id: blog.id)
  end
end


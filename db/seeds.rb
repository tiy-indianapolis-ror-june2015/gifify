DR_WHO_GIFS = Giphy.search('doctor who', {limit: 50})

counter = 0
10.times do
  password = Faker::Internet.password(10, 20)
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password
  )

  5.times do
    url = DR_WHO_GIFS[counter].original_image.url.to_s
    gif = Gif.create!(image_url: url)
    user.gifs << gif
    counter = counter + 1
  end

end

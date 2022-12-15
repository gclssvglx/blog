# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

6.times do
  User.create(name: Faker::Name.name)
end

User.all.each do |user|
  4.times do
    post = Post.create(
      title: Faker::Company.bs,
      content: Faker::Lorem.sentences(number: rand(1..4)).join(" "),
      user: user
    )

    6.times do
      Comment.create(
        content: Faker::Lorem.sentences(number: rand(1..4)).join(" "),
        user: User.where.not(name: user.name).sample,
        post: post
      )
    end
  end
end

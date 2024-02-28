# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create an admin user
admin_user = User.create!(email: "admin@example.com",password: "password",admin: true )

# Create non-admin users
5.times do |i|
  User.create!(email: "user#{i}@example.com", password: "password")
end

# Create three blogs for each user
User.all.each do |user|
  3.times do |i|
    user.blogs.create!(
        title: "Blog #{i+1}",
        body: "This is the content of blog #{i+1} created by #{user.email}"
    )
  end  
end

# For each blog, create a comment associated with it
Blog.all.each do |blog|
  blog.comments.create!(
    blog_id: blog.user_id,
    body: "This is a comment for blog #{blog.id}",
    user_id: blog.user_id
  )
end




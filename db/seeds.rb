require 'ffaker'

# Basic User
User.create(email: "anett@gmail.com", password: "password")

# Basic Admin
Admin.create(email: "anett@gmail.com", password: "password")

# Categories
Category.create(name: "web design")
Category.create(name: "web development")
Category.create(name: "photo")
Category.create(name: "mobile development")

# Authors
def biography
  FFaker::Lorem.paragraph(paragraph_count = 3)
end

def first_name
  FFaker::Name.name.split(' ').first
end

def last_name
  FFaker::Name.name.split(' ').last
end

20.times do
  Author.create(first_name: first_name, last_name: last_name, biography: biography)
end

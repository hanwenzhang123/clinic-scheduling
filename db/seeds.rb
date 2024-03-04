# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Message.destroy_all

Message.find_or_create_by(text: "Hello! Welcome to my app !!!")
Message.find_or_create_by(text: "Welcome...")
Message.find_or_create_by(text: "Hey !!!")
Message.find_or_create_by(text: "Hi there, this is my app !!!")
Message.find_or_create_by(text: "Enjoy your visit !!!")


# V1 - Clinical Scheduling
# ProviderAvailability.destroy_all
# Provider.destroy_all
# Member.destroy_all
# Consultation.destroy_all
# User.destroy_all

User.find_or_create_by(email: "admin@example.com") do |user|
  user.first_name = "admin"
  user.last_name = "admin"
  user.password = "test123"
end
User.find_or_create_by(email: "provider1@example.com") do |user|
  user.first_name = "provider1"
  user.last_name = "provider1"
  user.password = "test123"
end
User.find_or_create_by(email: "provider2@example.com") do |user|
  user.first_name = "provider2"
  user.last_name = "provider2"
  user.password = "test123"
end
User.find_or_create_by(email: "provider3@example.com") do |user|
  user.first_name = "provider3"
  user.last_name = "provider3"
  user.password = "test123"
end
User.find_or_create_by(email: "member1@example.com") do |user|
  user.first_name = "member1"
  user.last_name = "member1"
  user.password = "test123"
end
User.find_or_create_by(email: "member2@example.com") do |user|
  user.first_name = "member2"
  user.last_name = "member2"
  user.password = "test123"
end
User.find_or_create_by(email: "member3@example.com") do |user|
  user.first_name = "member3"
  user.last_name = "member3"
  user.password = "test123"
end

# User.create!([
#   {first_name: "admin", last_name: "admin", email: "admin@example.com", password: "test123"}, 
#   {first_name: "provider1", last_name: "provider1", email: "provider1@example.com", password: "test123"}, 
#   {first_name: "provider2", last_name: "provider2", email: "provider2@example.com", password: "test123"}, 
#   {first_name: "provider3", last_name: "provider3", email: "provider3@example.com", password: "test123"}, 
#   {first_name: "member1", last_name: "member1", email: "member1@example.com", password: "test123"}, 
#   {first_name: "member2", last_name: "member2", email: "member2@example.com", password: "test123"}, 
#   {first_name: "member3", last_name: "member3", email: "member3@example.com", password: "test123"}
# ])

@provider1 = Provider.find_or_create_by(user: User.find_by(email: "provider1@example.com")) do |provider|
  provider.speciality = "Physical Health"
end
@provider1 = Provider.find_or_create_by(user: User.find_by(email: "provider2@example.com")) do |provider|
  provider.speciality = "Mental Health"
end
@provider1 = Provider.find_or_create_by(user: User.find_by(email: "provider3@example.com")) do |provider|
  provider.speciality = "General Health"
end
@member1 = Member.find_or_create_by(user: User.find_by(email: "member1@example.com"))
@member2 = Member.find_or_create_by(user: User.find_by(email: "member2@example.com"))
@member3 = Member.find_or_create_by(user: User.find_by(email: "member3@example.com"))

# @provider1 = Provider.create!({user: User.find_by(email: "provider1@example.com"), speciality: "Physical Health"})
# @provider2 = Provider.create!({user: User.find_by(email: "provider2@example.com"), speciality: "Mental Health"})
# @provider3 = Provider.create!({user: User.find_by(email: "provider3@example.com"), speciality: "General Health"})
# @member1 = Member.create!({user: User.find_by(email: "member1@example.com")})
# @member2 = Member.create!({user: User.find_by(email: "member2@example.com")})
# @member3 = Member.create!({user: User.find_by(email: "member3@example.com")})

@consultation1 = Consultation.find_or_create_by(
  provider: @provider1,
  member: @member1,
  appointment_date: Date.parse("11/11/2023"),
  start_time: "9:00:00"
)
@consultation2 = Consultation.find_or_create_by(
  provider: @provider2,
  member: @member2,
  appointment_date: Date.parse("11/11/2023"),
  start_time: "10:00:00"
)
@consultation3 = Consultation.find_or_create_by(
  provider: @provider3,
  member: @member3,
  appointment_date: Date.parse("11/11/2023"),
  start_time: "11:00:00"
)

# @consultation1 = Consultation.create!({provider: @provider1, member: @member1, appointment_date: Date.parse("11/11/2023"), start_time: "9:00:00"})
# @consultation2 = Consultation.create!({provider: @provider2, member: @member2, appointment_date: Date.parse("12/12/2023"), start_time: "10:00:00"})
# @consultation3 = Consultation.create!({provider: @provider3, member: @member3, appointment_date: Date.parse("11/11/2023"), start_time: "11:00:00"})

ProviderAvailability.find_or_create_by(
  provider: @provider1,
  day_of_week: "Monday",
  shift_start_time: "9:00:00",
  shift_end_time: "17:00:00"
)
ProviderAvailability.find_or_create_by(
  provider: @provider2,
  day_of_week: "Monday",
  shift_start_time: "9:00:00",
  shift_end_time: "17:00:00"
)
ProviderAvailability.find_or_create_by(
  provider: @provider3,
  day_of_week: "Monday",
  shift_start_time: "9:00:00",
  shift_end_time: "17:00:00"
)

# ProviderAvailability.create([
#   {provider: @provider1, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
#   {provider: @provider2, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
#   {provider: @provider3, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"}
# ])

@member1.update!({upcoming_consultation: @consultation1})
@member2.update!({upcoming_consultation: @consultation2})
@member3.update!({past_consultation_ids: [@consultation3.id]})


# V2 - Shopping Cart
# Bundle.destroy_all
# Product.destroy_all
# CartItem.destroy_all
# ShoppingCart.destroy_all
# Checkout.destroy_all

apple = Product.find_or_create_by(name: 'Apple', price: 1.00)
banana = Product.find_or_create_by(name: 'Banana', price: 0.75)
orange = Product.find_or_create_by(name: 'Orange', price: 1.25)
book = Product.find_or_create_by(name: 'Book', price: 2.00)
laptop = Product.find_or_create_by(name: 'Laptop', price: 200.00)
counseling = Product.find_or_create_by(name: 'Counseling', price: 100.00)
treatment = Product.find_or_create_by(name: 'Treatment', price: 150.00)

# Seed data for bundles
fruit_bundle = Bundle.find_or_create_by(name: 'Fruit Bundle') do |bundle|
  bundle.products << apple
  bundle.products << banana
  bundle.products << orange
end

service_bundle = Bundle.find_or_create_by(name: 'Service Bundle') do |bundle|
  bundle.products << counseling
  bundle.products << treatment
end

# shopping_cart1 = ShoppingCart.create(user: @member1)

# System Message
GREEN = "\e[32m"
RESET_COLOR = "\e[0m"
puts "#{GREEN}Seed data created successfully.#{RESET_COLOR}"
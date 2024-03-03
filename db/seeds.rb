# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Message.create(text: "Hello! Welcome to my app !!!")
Message.create(text: "Welcome...")
Message.create(text: "Hey !!!")
Message.create(text: "Hi there, this is my app !!!")
Message.create(text: "Enjoy your visit !!!")


# V1 - Clinical Scheduling
ProviderAvailability.destroy_all
Provider.destroy_all
Member.destroy_all
Consultation.destroy_all
User.destroy_all

User.create!([
  {first_name: "admin", last_name: "admin", email: "admin@example.com", password: "test123"}, 
  {first_name: "provider1", last_name: "provider1", email: "provider1@example.com", password: "test123"}, 
  {first_name: "provider2", last_name: "provider2", email: "provider2@example.com", password: "test123"}, 
  {first_name: "provider3", last_name: "provider3", email: "provider3@example.com", password: "test123"}, 
  {first_name: "member1", last_name: "member1", email: "member1@example.com", password: "test123"}, 
  {first_name: "member2", last_name: "member2", email: "member2@example.com", password: "test123"}, 
  {first_name: "member3", last_name: "member3", email: "member3@example.com", password: "test123"}
])

@provider1 = Provider.create!({user: User.find_by(email: "provider1@example.com"), speciality: "Physical Health"})
@provider2 = Provider.create!({user: User.find_by(email: "provider2@example.com"), speciality: "Mental Health"})
@provider3 = Provider.create!({user: User.find_by(email: "provider3@example.com"), speciality: "General Health"})
@member1 = Member.create!({user: User.find_by(email: "member1@example.com")})
@member2 = Member.create!({user: User.find_by(email: "member2@example.com")})
@member3 = Member.create!({user: User.find_by(email: "member3@example.com")})
@consultation1 = Consultation.create!({provider: @provider1, member: @member1, appointment_date: Date.parse("11/11/2023"), start_time: "9:00:00"})
@consultation2 = Consultation.create!({provider: @provider2, member: @member2, appointment_date: Date.parse("12/12/2023"), start_time: "10:00:00"})
@consultation3 = Consultation.create!({provider: @provider3, member: @member3, appointment_date: Date.parse("11/11/2023"), start_time: "11:00:00"})

ProviderAvailability.create([
  {provider: @provider1, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {provider: @provider2, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {provider: @provider3, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"}
])

@member1.update!({upcoming_consultation: @consultation1})
@member2.update!({upcoming_consultation: @consultation2})
@member3.update!({past_consultation_ids: [@consultation3.id]})


# V2 - Shopping Cart
Product.destroy_all
Bundle.destroy_all
CartItem.destroy_all
Checkout.destroy_all

apple = Product.create(name: 'Apple', price: 1.00)
banana = Product.create(name: 'Banana', price: 0.75)
orange = Product.create(name: 'Orange', price: 1.25)
book = Product.create(name: 'Book', price: 2.00)
laptop = Product.create(name: 'Laptop', price: 200.00)
counseling = Product.create(name: 'Counseling', price: 100.00)
treatment = Product.create(name: 'Treatment', price: 150.00)

fruit_bundle = Bundle.create(name: 'Fruit Bundle')
fruit_bundle.products << apple
fruit_bundle.products << banana
fruit_bundle.products << orange

service_bundle = Bundle.create(name: 'Service Bundle')
service_bundle.products << counseling
service_bundle.products << treatment

# System Message
GREEN = "\e[32m"
RESET_COLOR = "\e[0m"
puts "#{GREEN}Seed data created successfully.#{RESET_COLOR}"
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

ProviderAvailability.destroy_all
Consultation.destroy_all
Member.destroy_all
Provider.destroy_all
User.destroy_all

User.create!([
  {id: 1, first_name: "admin", last_name: "admin", email: "admin@example.com", password: "test123"}, 
  {id: 2, first_name: "provider1", last_name: "provider1", email: "provider1@example.com", password: "test123"}, 
  {id: 3, first_name: "provider2", last_name: "provider2", email: "provider2@example.com", password: "test123"}, 
  {id: 4, first_name: "provider3", last_name: "provider3", email: "provider3@example.com", password: "test123"}, 
  {id: 5, first_name: "member1", last_name: "member1", email: "member1@example.com", password: "test123"}, 
  {id: 6, first_name: "member2", last_name: "member2", email: "member2@example.com", password: "test123"}, 
  {id: 7, first_name: "member3", last_name: "member3", email: "member3@example.com", password: "test123"}
])

Provider.create!([
  {id: 1, user: User.find(2), speciality: "Physical Health"}, 
  {id: 2, user: User.find(3), speciality: "Mental Health"}, 
  {id: 3, user: User.find(4), speciality: "General Health"}
])


Member.create!([
  {id: 1, user: User.find(5), upcoming_consultation_id: 1, past_consultation_ids: []}, 
  {id: 2, user: User.find(6), upcoming_consultation_id: 2, past_consultation_ids: []}, 
  {id: 3, user: User.find(7), upcoming_consultation_id: nil, past_consultation_ids: [3]}
])

Consultation.create!([
  {id: 1, provider: Provider.find(1), member: Member.find(1), appointment_date: Date.parse("11/11/2023"), start_time: "9:00:00"},
  {id: 2, provider: Provider.find(2), member: Member.find(2), appointment_date: Date.parse("12/12/2023"), start_time: "10:00:00"},
  {id: 3, provider: Provider.find(3), member: Member.find(3), appointment_date: Date.parse("10/10/2023"), start_time: "11:00:00"}
])

ProviderAvailability.create([
  {id: 1, provider: Provider.find(1), day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {id: 2, provider: Provider.find(2), day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {id: 3, provider: Provider.find(3), day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"}
])
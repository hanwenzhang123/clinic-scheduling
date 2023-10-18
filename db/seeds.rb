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
User.create(
  {user_id: 1, first_name: "admin", last_name: "admin", email: "admin@example.com", password: "test123"}, 
  {user_id: 2, first_name: "provider1", last_name: "provider1", email: "provider1@example.com", password: "test123"}, 
  {user_id: 3, first_name: "provider2", last_name: "provider2", email: "provider2@example.com", password: "test123"}, 
  {user_id: 4, first_name: "provider3", last_name: "provider3", email: "provider3@example.com", password: "test123"}, 
  {user_id: 5, first_name: "member1", last_name: "member1", email: "member1@example.com", password: "test123"}, 
  {user_id: 6, first_name: "member2", last_name: "member2", email: "member2@example.com", password: "test123"}, 
  {user_id: 7, first_name: "member3", last_name: "member3", email: "member3@example.com", password: "test123"}
)
Provider.create(
  {provider_id: 1, user_id: 2, speciality: "Physical Health"}, 
  {provider_id: 2, user_id: 3, speciality: "Mental Health"}, 
  {provider_id: 3, user_id: 4, speciality: "General Health"}
)
Member.create(
  {member_id: 1, user_id: 5, upcoming_consultation: 1, past_consultations: []}, 
  {member_id: 2, user_id: 6, upcoming_consultation: 2, past_consultations: []}, 
  {member_id: 3, user_id: 7, upcoming_consultation: null, past_consultations: [3]},
)
Consultation.create(
  {consultation_id: 1, provider_id: 1, member_id: 1, appointment_date: Date.parse("11/11/2023"), start_time: "9:00:00", end_time: "10:00:00"},
  {consultation_id: 2, provider_id: 2, member_id: 2, appointment_date: Date.parse("12/12/2023"), start_time: "10:00:00", end_time: "11:00:00"},
  {consultation_id: 3, provider_id: 3, member_id: 3, appointment_date: Date.parse("10/10/2023"), start_time: "11:00:00", end_time: "12:00:00"}
)
ProviderAvailability.create(
  {provider_availability_id: 1, provider_id: 1, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {provider_availability_id: 2, provider_id: 2, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
  {provider_availability_id: 3, provider_id: 3, day_of_week: "Monday", shift_start_time: "9:00:00", shift_end_time: "17:00:00"},
)
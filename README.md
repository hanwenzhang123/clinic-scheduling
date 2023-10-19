# Clinic Scheduling System
A simple scheduling system for a clinic has a list of dates that a doctor is available to see patients.

### Technologies
- Frontend: React, JavaScript, 
- Backend: Ruby-on-Rails
- Database: PostgreSQL

## Start the App
### Back End
```sh
# Install Dependencies
bundle install

# Databse Related Setup
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

# Start the Backend Server
bundle exec rails server -p 3000
```

### Front End
```sh
# Install Dependencies
yarn install

# Building Frontend
yarn build

# Start the Client
yarn start
```

### Database Related Setup
```sh
psql -h /tmp/ clinic_scheduling
clinic_scheduling=# CREATE ROLE admin LOGIN PASSWORD 'admin';
```

### Ruby Version 3.2.2
#### Download `ruby@3.2` view Homebrew
```sh
brew install ruby@3.2
brew link --overwrite ruby@3.2 --force
echo 'export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Model
### Tables
##### User
- user_id: PK
- first_name
- last_name
- email
- password

##### Provider
- provider_id: PK
- user_id: FK
- speciality

##### Member
- member_id: PK
- user_id: FK
- upcoming_consultation
- past_consultations

##### Consultation
- consultation_id:PK
- provider_id: FK
- member_id: FK
- appointment_date
- start_time
- end_time

##### ProviderAvailability
- provider_availability_id:PK
- provider_id: FK
- day_of_week
- shift_start_time
- shift_end_time

#### Create Data Model
```sh
bundle exec rails generate migration CreateProvider
bundle exec rails generate migration CreateMember
bundle exec rails generate migration CreateConsultations
bundle exec rails generate migration CreateProviderAvailabilities
bundle exec rails db:rollback
bundle exec rails generate model Provider
bundle exec rails generate model Member
bundle exec rails generate model Consultation
bundle exec rails generate model ProviderAvailability
bundle exec rails db:migrate
```
```sh
bundle exec rails generate model Users
rails generate migration RemoveEmailFromProvider
rails generate migration RemoveEmailFromMember
bundle exec rails generate migration AddUpcomingConsultationToMembers upcoming_consultation:integer
bundle exec rails g migration AddUserIdToProviders user:references
bundle exec rails g migration AddProviderIdToConsultations provider:references
bundle exec rails g migration AddMemberIdToConsultations member:references
bundle exec rails g migration AddProviderToProviderAvailability provider:references
```

## Controller

## View
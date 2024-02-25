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
https://www.devart.com/dbforge/postgresql/how-to-install-postgresql-on-macos/
```sh
psql -h /tmp/ clinic_scheduling_system
clinic_scheduling_system=# CREATE ROLE admin LOGIN PASSWORD 'admin';
```

### Ruby Version 3.2.2
#### Download `ruby@3.2` view Homebrew
```sh
brew install ruby@3.2
brew link --overwrite ruby@3.2 --force
echo 'export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Database
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
- consultation_id: FK
- past_consultation_ids

##### Consultation
- consultation_id: PK
- provider_id: FK
- member_id: FK
- status
- appointment_date
- start_time
- end_time

##### ProviderAvailability
- provider_availability_id: PK
- provider_id: FK
- day_of_week
- shift_start_time
- shift_end_time

##### Message
- message_id: PK
- consultation_id: FK

## APIs
```sh
GET - /api/v1/providers
GET - /api/v1/providers/:id
GET - /api/v1/members
GET - /api/v1/members/:id
GET - /api/v1/consultations
GET -/api/v1/consultations/:id
POST - /api/v1/consultations
DELETE -/api/v1/consultations/:id
POST /api/v1/consultations/:id/consultation_cancelled
POST /api/v1/consultations/:id/consultation_completed
```

## MVC

#### Model
##### Create Data Model
```sh
bundle exec rails db:rollback
bundle exec rails db:create
bundle exec rails db:reset
bundle exec rails db:migrate
bundle exec rails db:seed
```
```sh
bundle exec rails generate migration CreateProviders
bundle exec rails generate migration CreateMembers
bundle exec rails generate migration CreateConsultations
bundle exec rails generate migration CreateProviderAvailabilities
bundle exec rails generate migration CreateUsers
bundle exec rails generate model Provider
bundle exec rails generate model Member
bundle exec rails generate model Consultation
bundle exec rails generate model ProviderAvailability
bundle exec rails generate model Users
```
```sh
rails generate migration RemoveEmailFromProvider
rails generate migration RemoveEmailFromMember
bundle exec rails g migration AddUpcomingConsultationToMembers upcoming_consultation_id:integer
bundle exec rails g migration AddUserIdToProviders user:references
bundle exec rails g migration AddProviderIdToConsultations provider:references
bundle exec rails g migration AddMemberIdToConsultations member:references
bundle exec rails g migration AddProviderToProviderAvailability provider:references
```

#### Controller
```sh
bin/rails generate controller api::v1::ProvidersController
bin/rails generate controller api::v1::MembersController
bin/rails generate controller api::v1::ConsultationsController
bin/rails generate controller Errors not_found
```

#### View
```sh
```

## Other Commands
#### Rails Console
```sh
Member.find(1).upcoming_consultation
```

#### PostgreSQL
```sh
psql -l   # list of datbase and owner of the database
psql -h localhost -U hanwenzhang -d postgres -c "DROP DATABASE clinic_scheduling"
psql -U hanwenzhang clinic_scheduling_system
```

#### Swagger Related Commands
```
bundle exec rails g rswag:install
bundle exec rails g rswag:api:install
bundle exec rails g rswag:ui:install
bundle exec rails generate rspec:swagger API::ConsultationController
```

# Boilerplate code
Solving M1 chip MacBook with a hard time running rails new to create a new project using Ruby version 3.2.2.

## Download Ruby view Homebrew
```sh
brew install ruby@3.2
brew link --overwrite ruby@3.2 --force
echo 'export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

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

## Database Related Setup
```sh
psql -h /tmp/ clinic_scheduling
clinic_scheduling=# CREATE ROLE admin LOGIN PASSWORD 'admin';
```

## Create Data Model
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

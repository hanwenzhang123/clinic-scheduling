# Boilerplate code
Solving M1 chip MacBook with a hard time running rails new to create a new project using Ruby version 3.1.4.

### Download Ruby view Homebrew
```sh
brew install ruby@3.1
brew link --overwrite ruby@3.1 --force
echo 'export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"' >> ~/.zshrc
```

### Install Dependencies
```sh
# backend
bundle install

# frontend
yarn install
```

### Start the App
```sh
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
yarn install
yarn build
yarn start
bundle exec rails server -p 3000
```
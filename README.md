# QuizMaster

[![circleci](https://circleci.com/gh/fuefw/quiz_master.svg?style=shield)](https://circleci.com/gh/fuefw/quiz_master/)

## How to Run Locally

### API Setup

From project root, change to **api** directory

```bash
cd api
```

Switch to ruby **2.3.1** via rbenv or similar

```bash
brew install rbenv
brew install ruby-build
rbenv install 2.3.1
rbenv local 2.3.1
```

Install gems

```bash
bundle install --path=vendor/bundle
```

Install and setup **postgresql** if not installed

```bash
brew install postgresql
...
```

Update `config/database.yml` if desired and create + migrate + seed the development database

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

Start server

```bash
bundle exec rails server
```

### Client Setup

From project root, change to **client** directory

```bash
cd client
```

Install **yarn**

```bash
brew install yarn
```

Install project dependencies

```bash
yarn install
```

In `/client/config/dev.env.js` set the value of `QUIZ_MASTER_API_HOST` to your local API

Start dev server
```bash
yarn run dev
```

Visit `http://localhost:8080` in a browser

## Attributions

* This project uses stock images from [Pexels](https://www.pexels.com/).
* This project uses illustrations from [Freepik](http://www.freepik.com/).

## Testing

Run API tests:
```bash
cd api
bundle exec rspec spec
```

Run client tests:
```bash
cd client
yarn run unit
```

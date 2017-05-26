# README

### Installation

```bash
  rvm install 2.4.1 #if necessary
  # install Redis if you haven't it
  
  git clone git@github.com:lxkuz/web-page-indexer.git
  cd web-page-indexer
  bundle
  cp config/database.yml.sample config/database.yml
  # change DB settings if necessary
  rake db:create
  rake db:migrate
  rails s
```  

### Installation via Docker

```bash
  docker-compose build
  docker-compose up -d db
  docker-compose run web rake db:create db:migrate
  docker-compose up web
```

### API endpoints

* `POST '/'` - create new page, params:  url  (could be passed both with and without `http(s)://`)

* `GET '/'` - list pages, params: page (pagination by last 10 created pages, the first page renders by default)

* `GET '/swagger_editor'` - open swagger editor with swagger.yml config [Link](https://web-page-indexer.herokuapp.com/swagger_editor)

* `GET '/swagger'` - open swagger UI with swagger.yml config [Link](https://web-page-indexer.herokuapp.com/swagger)

### Technologies
* `Rails 5`, `Ruby 2.4.1`
* `Rubocop` with pre-commit hook used
* swagger.yml for API reference and testing
* `Rspec` testing engine with models, controllers and integration tests
* `SimpleCov` to calculate tests coverage, current tests coverage is 100.0% covered at 1.58 hits/line
* `Travis CI` integration
*  The project wrapped in `Docker` for fast development start
* `Nokogiri` to search HTML tags
* `Sidekiq` with `Redis` for background indexing job

### Deploy

* Project already have deployed on `Heroku` (with `PostgreSQL` and `Redis` addons) [Swagger UI](https://web-page-indexer.herokuapp.com/swagger)
* Connected with my Github account, so it will be updated for each push to master branch

### Tests

```
  bundle exec rspec spec
```
or in case of using Docker:
```
  docker-compose run web rspec spec
```

# README

API endpoints:

* POST '/' - create new page

* GET '/' - list pages

* GET '/swagger_editor' - open swagger editor with swagger.yml config

* GET '/swagger' - open swagger UI with swagger.yml config

### Technologies
* Rubocop with pre-commit hook used
* swagger.yml for API reference and testing
* Rspec testing engine with models, controllers and integration tests
* SimpleCov to calculate tests coverage, current tests coverage is 100.0% covered at 1.79 hits/line
* Nokogiri to search HTML tags
* Sidekiq with Redis for background indexing job

### Deploy
* Project already have deployed on Heroku (with PostgreSQL and Redis addons)
* Connected with my Github account, so it will be updated for each push to master branch

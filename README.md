# Elasticsearch for Users

## Codebase Setup

* Clone the project using Code dropdown
* Run `bundle install` to get all gems working
* Create or modify `database.yml` to suit your database environment
* If `master.key` required to proceed further for setup, contact project administrator to get it
* Setup db by running commands `rails db:create && rails db:migrate`
* Start the server using `rails s`

## Elasticsearch Setup

* Make sure to setup elasticsearch locally or a cloud based deployment/cluster setup
* This app uses the configuration for cloud based setup
* Follow-up the official docs of [elasticsearch](https://www.elastic.co/guide/index.html) and rails client gem [elasticsearch-rails](https://github.com/elastic/elasticsearch-rails)

## Prepare Dataset

* Comment out `include Searchable` line in `user.rb` and run `rails db:seed` to setup fake users data locally
* The purpose to comment out is to disable auto sync on elasticsearch side
* Once its successful, checkout to `rails c` and run `User.count`. This should give a number of 10,000
* Run the command `User.__elasticsearch__.create_index!` to index your data
* Afterwards run `User.import(force: true)` to import your data on elastcicsearch's end

## Resources

- [Full-text Search with Elasticsearch in Rails](https://www.honeybadger.io/blog/rails-elasticsearch/)
- [Elastic Ruby client docs](https://www.elastic.co/guide/en/elasticsearch/client/ruby-api/7.17/ruby_client.html)


Enjoy :sunglasses:

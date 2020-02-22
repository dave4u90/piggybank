# README
* Ruby version => 2.7

* System dependencies => 
Linux Platform/MacOS platform 
MySQL 5.7+

* Initial Setup
  rvm install 2.7
  rvm gemset create piggybank
  rvm use 2.7@piggybank
  bundle
  rails db:create
  rails:migrate

* How to run the test suite
rspec spec/

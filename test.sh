bundle exec rails db:migrate RAILS_ENV=test
bundle exec rake assets:precompile RAILS_ENV=Test
bundle exec rake test
rubycritic --no-browser -s 85 -p coverage/rubycritic
rubocop --format html . > coverage/rubocop.html
license_finder report --format html --decisions-file licenses.yml > coverage/license_report.html

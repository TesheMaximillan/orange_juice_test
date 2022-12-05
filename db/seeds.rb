# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless Rails.env.development?
  puts "[db/seeds.rb] Seed data is being loaded in development mode. not #{Rails.env.production?}"
  exit 0
end

require 'factory_bot'

User.destroy_all
SearchItem.destroy_all

puts '[db/seeds.rb] Creating users...'

User.create(username: 'Jane Doe')

SearchItem.create([
                    { user: User.all.sample, text: 'What is ruby on rails?', rank: 1 },
                    { user: User.all.sample, text: 'What is ruby?', rank: 2 },
                    { user: User.all.sample, text: 'What is rails?', rank: 3 },
                    { user: User.all.sample, text: 'What is TDD?', rank: 4 },
                    { user: User.all.sample, text: 'What is race condition?', rank: 5 },
                    { user: User.all.sample, text: 'What is concurrency?', rank: 6 },
                    { user: User.all.sample, text: 'What is parallelism?', rank: 7 },
                    { user: User.all.sample, text: 'What is thread?', rank: 8 },
                    { user: User.all.sample, text: 'What is process?', rank: 9 },
                    { user: User.all.sample, text: 'What is database?', rank: 10 }
                  ])

puts '[db/seeds.rb] Done...'

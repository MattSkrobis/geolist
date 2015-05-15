# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tasks = [Task.create(title: 'Task1'), Task.create(title: 'Task2')]
list = [List.create(name: 'MyList', tasks: tasks)]
User.create(first_name: 'John', last_name: 'Wayne', email: 'user1#@example.com', password: 'secret', password_confirmation: 'secret', lists: list)
User.create(first_name: 'Fred', last_name: 'Astaire', email: 'user2#@example.com', password: 'secret', password_confirmation: 'secret')

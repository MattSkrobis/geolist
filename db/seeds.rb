# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tasks2 = [Task.create(title: 'Task1', latitude: 49.8225, longitude: 19.044444),
          Task.create(title: 'Task2', latitude: 49.8223, longitude: 19.04435),
          Task.create(title: 'Task3', latitude: 49.822, longitude: 19.04446),
          Task.create(title: 'Task4', latitude: 49.8227, longitude: 19.001)]
tasks = [Task.create(title: 'Task5', latitude: 49.82213, longitude: 19.0445),
         Task.create(title: 'Task6', latitude: 49.8229, longitude: 19.04123),
         Task.create(title: 'Task7', latitude: 49.822765, longitude: 19.044666),
         Task.create(title: 'Task8', latitude: 49.8224, longitude: 19.04924)]
list = [List.create(name: 'MyList', tasks: tasks)]
list2 = [List.create(name: 'MyList2', tasks: tasks2)]
User.create(first_name: 'John', last_name: 'Wayne', email: 'user1@example.com',
            password: 'secret', password_confirmation: 'secret', lists: list,
            latitude: 49.82213, longitude: 19.0445)
User.create(first_name: 'Fred', last_name: 'Astaire', email: 'user2@example.com',
            password: 'secret', password_confirmation: 'secret', lists: list2,
            latitude: 49.8225, longitude: 19.044444)

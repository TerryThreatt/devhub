# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# initial user
User.create(username: 'terrythreatt', email: 'terry.threatt@gmail.com', password: 'password')

# sample tasks
Task.create(name: 'Spec')
Task.create(name: 'Review')
Task.create(name: 'Plan')
Task.create(name: 'Code')
Task.create(name: 'Backlog')
Task.create(name: 'Design')
Task.create(name: 'Testing')
Task.create(name: 'Deploy')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create(
  :name => 'Robert',
  :email => 'rob@ga.co',
  :password => 'chicken',
  :admin => true
)
Project.destroy_all
p1 = Project.create(
:name => 'Project1',
:user_id => u1.id
)
Job.destroy_all
j1 = Job.create(
:description => 'Start new website',
:start_time => '2013-02-02 01:00:00',
:end_time => '2013-02-02 02:00:00',
:project_id => p1.id
)

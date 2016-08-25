# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Role.all.count == 0
	['admin', 'alumno', 'apoderado'].each do |role|
	  Role.find_or_create_by({name: role})
	end
end

if Assignment.all.count == 0
	assignment = Assignment.new
	assignment.user = User.find(1);
	assignment.role = Role.find_by_name('admin')
	assignment.save
end
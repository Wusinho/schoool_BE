require 'faker'

first_name = Faker::Name.first_name
last_name = Faker::Name.middle_name
password = '123456'
Admin.create(name: first_name, surname: last_name, email: 'admin@gmail.com', password: password, password_confirmation: password)
# grado = Edlevel.create(ed_level: 5, nivel: 1)
# sA = Section.create(section: 0)
# sB = Section.create(section: 1)
# sC = Section.create(section: 2)
# sD = Section.create(section: 3)
# sE = Section.create(section: 4)
# sections = [sA,sB,sC,sD,sE]
#
# 5.times do |i|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.middle_name
#   email = "teacher_#{i}@gmail.com"
#   Teacher.create(name: first_name, surname: last_name, email: email, password: password, password_confirmation: password)
# end
#
# class_room = Classroom.create(edlevel_id: grado.id, section_id: sA.id, participants: 10)
#
# 10.times do |i|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.middle_name
#   email = "student_#{i}@gmail.com"
#   Student.create(
#     name: first_name,
#     surname: last_name,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     active: true,
#     classroom_id: class_room.id
#   )
# end

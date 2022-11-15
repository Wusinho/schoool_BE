require 'faker'

first_name = Faker::Name.first_name
last_name = Faker::Name.middle_name
password = '123456'
Admin.create(name: first_name, surname: last_name, email: 'admin@gmail.com', password: password, password_confirmation: password)
grado = Edlevel.create(ed_level: 5, nivel: 'Secundaria')
sA = Section.create(section: 'A')
sB = Section.create(section: 'B')
sC = Section.create(section: 'C')
sD = Section.create(section: 'D')
sE = Section.create(section: 'E')
sections = [sA,sB,sC,sD,sE]

5.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.middle_name
  email = "teacher_#{i}@gmail.com"
  Teacher.create(name: first_name, surname: last_name, email: email,  edlevel_id: grado.id, section_id: sections[i].id, password: password, password_confirmation: password)
end

10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.middle_name
  email = "student_#{i}@gmail.com"
  Student.create(
    name: first_name,
    surname: last_name,
    email: email,
    password: password,
    password_confirmation: password,
    active: true,
    edlevel_id: grado.id,
    section_id: sA.id,
  )
end

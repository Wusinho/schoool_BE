require 'faker'

first_name = Faker::Name.first_name
last_name = Faker::Name.middle_name
password = '123456'
Admin.create(name: first_name, surname: last_name, email: 'admin@gmail.com', password: password, password_confirmation: password)
grado = Edlevel.create(ed_level: 5, nivel: 1)
sA = Section.create(section: 0)
sB = Section.create(section: 1)
sC = Section.create(section: 2)
sD = Section.create(section: 3)
sE = Section.create(section: 4)

5.times do
  Course.create(name: Faker::Educator.subject)
end
c1 = Classroom.create(edlevel_id: grado.id, section: sA, participants: 10)
2.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.middle_name
  email = "teacher_#{i}@gmail.com"
  Teacher.create(name: first_name, surname: last_name, email: email, password: password, password_confirmation: password)
end

sub = Subject.create(times_week: '2', classroom_id: c1.id, course_id: Course.first.id, teacher_id: Teacher.first.id)

sub.times_week.to_i.times do |i|
  starts = [8,9,10].sample
  Timetable.create(week_day: i, starts_at: starts, ends_at:starts + 2)
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
    classroom_id: c1.id
  )
end

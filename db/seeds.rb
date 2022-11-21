require 'faker'

first_name = Faker::Name.first_name
last_name = Faker::Name.middle_name
password = '123456'
Admin.create(name: first_name, surname: last_name, email: 'admin@gmail.com', password: password, password_confirmation: password)
quinto_A= GradeLevel.create(grade_level: 1, grade: 5, section: 0)
quinto_B= GradeLevel.create(grade_level: 1, grade: 5, section: 1)

c5a = Classroom.create(grade_level_id: quinto_A.id, participants: 10)
c5b = Classroom.create(grade_level_id: quinto_B.id, participants: 10)

cursos = ['Matematicas', 'Biologia', 'Lenguaje', 'Aritmetica', 'Quimica', 'Ingles', 'Geografia', 'Fisica']
cursos.each do | name|
  Course.create(name: name)
end

5.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.middle_name
  email = "teacher_#{i}@gmail.com"
  Teacher.create(name: first_name, surname: last_name, email: email, password: password, password_confirmation: password)
end

classrooms = Classroom.all
courses = Course.all

classrooms.each_with_index do|classroom, index|
  courses.sample(4).each do |course|
    times = [1,2].sample
    teacher = Teacher.all.sample
    sub = Subject.create(times_week: times, classroom_id: classroom.id, course_id: course.id, teacher_id: teacher.id)
    day = [0,1,2,3].sample
    sub.times_week.to_i.times do|i|
      starts = [8,9,10,11,12,13,14,15].sample
      Timetable.create(week_day: day + i, starts_at: starts, ends_at:starts + 2, subject_id: sub.id)
    end
  end

  classroom.participants.times {|i|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.middle_name
    email = "student_#{index}_#{i}@gmail.com"
    Student.create(
      name: first_name,
      surname: last_name,
      email: email,
      password: password,
      password_confirmation: password,
      active: true,
      classroom_id: classroom.id
    )
  }
end


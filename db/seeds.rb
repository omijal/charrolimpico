# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tacho = User.create(username: 'tacho', email: 'tachoguitar@gmail.com', password: '1234')

tacho.save!

omijal = Organization.create(
  fullname: 'Olimpiada de Informática del Estado de Jalisco',
  shortname: 'omijal'
)

admin = Role.create(
  name: 'admin'
)

omijal.save!

estatal = Career.create(shortname: 'omijal', fullname: 'OMIJal Fase Estatal')
estatal.organization = omijal
estatal.save!

omega = Judge.create(shortname: 'omega',
                     fullname: 'omegaup',
                     url: 'https://omegaup.com',
                     configs: {})
omega.save!
numteo = Category.create(
  name: 'number theory',
  organization: omijal
)
numteoi = Course.create(
  shortname: 'numbertheoryi',
  fullname: 'Teoría de Números I',
  organization: omijal
)
numteoi.save!

divisores = Problem.create(
  shortname: 'divisoresnfactorial',
  fullname: 'Divisores de N!',
  url: 'https://omegaup.com/arena/problem/Divisores-de-N',
  organization: omijal
)
divisores.judge = omega

divisores.save!

task = Task.create(course: numteoi, problem: divisores)
task.save!

homework = Homework.create(user: tacho, task: task, status: 'to-do')
homework.save!

divisores.categories << numteo
Enrollment.create(user: tacho, role_id: admin.id, career: estatal)
Registration.create(user: tacho, course: numteoi, status: 'locked')
numteoi.careers << estatal
tacho.save!
omijal.save!
estatal.save!
omega.save!

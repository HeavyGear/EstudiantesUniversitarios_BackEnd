# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Poblar la tabla Role
Role.create(name: 'Administrador')
Role.create(name: 'Usuario')

# Poblar la tabla University
20.times do
  University.create(name: Faker::Educator.university, city: Faker::GameOfThrones.city, 
    department: Faker::LeagueOfLegends.location)
end

# Poblar la tabla Major
20.times do
  Major.create(name: Faker::ProgrammingLanguage.name)
end

# Poblar la tabla DocumentState
DocumentState.create(name: 'Pendiente')
DocumentState.create(name: 'Rechazado')
DocumentState.create(name: 'Aprobado')

# Poblar la tabla TypePublication
TypePublication.create(name: 'Evento')
TypePublication.create(name: 'Asesoría')
TypePublication.create(name: 'Publicación')

#Poblar la tabla ProjectDocument
15.times do
  ProjectDocument.create(document_state_id: rand(1..3), project_id: rand(1..20), 
    year: rand(1..2018), period: rand(1..2))
end

#Poblar la tabla Project
Project.create(name: "Proyecto de pruebas",
    description: "Probando los proyectos",
    user_id: 1)
19.times do
  Project.create(name: Faker::LeagueOfLegends.champion,
    description: Faker::Job.title,
    user_id: rand(1..25))
end

# Poblar la tabla Publication
  # Función para una fecha en un rango
  def rand_in_range(from, to)
    rand * (to - from) + from
  end

  # Función para una fecha entre una inicial y y la actual
  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

Publication.create(name: "Publicación de pruebas",
  description: "Probando las publicaciones",
  startdate: rand_time(60.days.ago),
  latitude: 4.35,
  longitude: 97.28,
  type_publication_id: 1,
  user_id: 1)
9.times do
  Publication.create(name: Faker::Book.title,
  description: Faker::LeagueOfLegends.quote,
  startdate: rand_time(60.days.ago),
  place: Faker::LeagueOfLegends.location,
  latitude: 4.35,
  longitude: 97.28,
  type_publication_id: rand(1..3),
  user_id: rand(1..25))
end

# Poblar la tabla Comment
50.times do
  Comment.create(body: Faker::FamilyGuy.quote,
  username: Faker::FamilyGuy.character,
  publication_id: rand(1..10))
end

# Poblar la tabla User
User.create(name: 'David Herrera',
  idnumber: rand(1..999999),
  email: 'dacherreragu@unal.edu.co',
  password: '123456',
  role_id: 1) # Administrador
User.create(name: 'Jhon Mueses',
  idnumber: rand(1..999999),
  email: 'jjmuesesq@unal.edu.co',
  password: '123456',
  role_id: 2) # Usuario
User.create(name: 'Gonzalo Baez',
  idnumber: rand(1..999999),
  email: 'gebaezs@unal.edu.co',
  password: '123456',
  role_id: 2) # Usuario
22.times do
  User.create(name: Faker::Name.name,
  idnumber: rand(1..999999),
  email: Faker::Internet.email,
  password: '123456',
  role_id: rand(1..2))
end

# Poblar la tabla Image
40.times do
  i = rand(1..2)
  type = ""
  idParent = 0

  if i == 1
    type = "User"
    idParent = rand(1..25)
  else
    type = "Publication"
    idParent = rand(1..10)
  end

  Image.create(content: Faker::File.file_name('path/to', 'images'), 
  imageable_id: idParent,
  imageable_type: type)
end

# Poblar la tabla Document
40.times do
  i = rand(1..2)
  type = ""
  idParent = 0

  if i == 1
    type = "ProjectDocument"
    idParent = rand(1..15)
  else
    type = "Publication"
    idParent = rand(1..10)
  end

  Document.create(content: Faker::File.file_name('path/to', 'documents'), 
  uploadeable_id: idParent,
  uploadeable_type: type)
end

# Poblar la tabla UserUniversity
25.times do
  UserUniversity.create(user_id: rand(1..25), university_id: rand(1..20), major_id: rand(1..20))
end

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
DocumentState.create(name: 'Sin revisar')
DocumentState.create(name: 'En proceso de revisión')
DocumentState.create(name: 'Rechazado')
DocumentState.create(name: 'Aprobado')

# Poblar la tabla ProjectState
ProjectState.create(name: 'Sin iniciar')
ProjectState.create(name: 'En curso')
ProjectState.create(name: 'Terminado')

# Poblar la tabla TypePublication
TypePublication.create(name: 'Publicación informativa')
TypePublication.create(name: 'Evento')
TypePublication.create(name: 'Asesoría')

#Poblar la tabla ProjectDocument
15.times do
  ProjectDocument.create(document_state_id: rand(1..3), project_id: rand(1..20), approved: Faker::Boolean.boolean, 
    year: rand(1..2018), period: rand(1..2))
end

#Poblar la tabla Project
20.times do
  Project.create(name: Faker::LeagueOfLegends.champion,
    description: Faker::Job.title,
    user_id: rand(1..25), supervisor_id: rand(1..25), project_state_id: rand(1..3))
end

# Poblar la tabla Publication
10.times do
  Publication.create(name: Faker::Book.title,
  description: Faker::LeagueOfLegends.quote,
  startDate: Time.now,
  endDate: Time.now,
  place: Faker::LeagueOfLegends.location,
  latitude: 4.35,
  longitude: 97.28,
  type_publication_id: rand(1..3),
  user_id: rand(1..25))
end

# POblar la tabla Comment
50.times do
  Comment.create(body: Faker::FamilyGuy.quote,
  publication_id: rand(1..10))
end

# Poblar la tabla User
User.create(name: 'David Herrera',
  idnumber: rand(1..999999),
  email: 'dacherreragu@unal.edu.co',
  beneficiary: Faker::Boolean.boolean,
  password: '123456',
  role_id: 1) # Administrador
User.create(name: 'Jhon Mueses',
  idnumber: rand(1..999999),
  email: 'jjmuesesq@unal.edu.co',
  beneficiary: Faker::Boolean.boolean,
  password: '123456',
  role_id: 2) # Usuario
User.create(name: 'Gonzalo Baez',
  idnumber: rand(1..999999),
  email: 'gebaezs@unal.edu.co',
  beneficiary: Faker::Boolean.boolean,
  password: '123456',
  role_id: 2) # Usuario
22.times do
  User.create(name: Faker::Name.name,
  idnumber: rand(1..999999),
  email: Faker::Internet.email,
  beneficiary: Faker::Boolean.boolean,
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

# Poblar la tabla UserProjectDocument
25.times do
  UserProjectDocument.create(user_id: rand(1..25), project_document_id: rand(1..15), 
  revisionDate: DateTime.now, comment: Faker::FamousLastWords.last_words,
  response: Faker::LeagueOfLegends.quote)
end

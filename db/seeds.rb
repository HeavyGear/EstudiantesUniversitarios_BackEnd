# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Poblar la tabla Role
Role.create(name: 'Autoridad tradicional')
Role.create(name: 'Líder')
Role.create(name: 'Beneficiario')
Role.create(name: 'Aspirante')

# Poblar la tabla University
20.times do
  University.create(name: Faker::University.name, city: Faker::GameOfThrones.city, department: Faker::GameOfThrones.house)
end

# Poblar la tabla Major
20.times do
  Major.create(name: Faker::WorldCup.stadium)
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
TypePublication.create(name: 'Comentario')

# Poblar la tabla Image
5.times do
  Image.create(link: Faker::File.file_name('foo/bar', 'baz', 'png'), #=> "foo/bar/baz.doc",
    imageable_id: rand(1..5), imageable_type: 'User')
end
10.times do
  Image.create(link: Faker::File.file_name('foo/bar', 'baz', 'jpg'), #=> "foo/bar/baz.doc",
    imageable_id: rand(1..7), imageable_type: 'Publication')
end

# Poblar la tabla UserImage
5.times do
  UserImage.create(idUser: rand(1..25), idImage: rand(1..5))
end

#Poblar la tabla PublicationImage
7.times do
  PublicationImage.create(idPublication: rand(1..10), idImage: rand(6..12))
end

# Poblar la tabla Document
5.times do
  Document.create(link: Faker::File.file_name('foo/bar', 'baz', 'pdf'), #=> "foo/bar/baz.doc",
    documentable_id: rand(1..5), documentable_type: 'Project')
end
20.times do
  Document.create(link: Faker::File.file_name('foo/bar', 'baz', 'jpg'), #=> "foo/bar/baz.doc",
    documentable_id: rand(1..7), documentable_type: 'Publication')
end

#Poblar la tabla ProjectDocument
5.times do
  ProjectDocument.create(idProject: rand(1..20), idDocument: rand(1..5))
end

# Poblar la tabla PublicationDocument
7.times do
  PublicationDocument.create(idPublication: rand(1..10), idDocument: rand(6..12))
end

# Poblar la tabla Project
20.times do
  Project.create(name: Faker::LeagueOfLegends.champion,
    description: Faker::LeagueOfLegends.quote,
    idUser: rand(1..25), supervisor: rand(1..25), idState: rand(1..3))
end

# Poblar la tabla Publication
10.times do
  Publication.create(name: Faker::FamilyGuy.character,
  description: Faker::LeagueOfLegends.quote,
  startdate: Time.now,
  enddate: Time.now,
  place: Faker::LeagueOfLegends.location,
  latitude: 4.35,
  longitude: 97.28,
  typePublication: rand(1..3),
  idUser: rand(1..25),
  parent: nil)
end

# Poblar la tabla User
25.times do
  User.create(name: Faker::Pokemon.name,
  idNumber: rand(1..999),
  email: Faker::Internet.email,
  beneficiary: Faker::Boolean.boolean,
  idRole: rand(1..4),
  project: rand(1..20),
  university: rand(1..20),
  major: rand(1..20))
end

# Poblar la tabla UserMajorUniversity
20.times do
  UserMajorUniversity.create(idUser: rand(1..25), idUniversity: rand(1..20),
  idMajor: rand(1..20))
end

# Poblar la tabla UserProjectDocument
20.times do
  UserProjectDocument.create(idUser: rand(1..25), idProjectDocument: rand(1..20),
  description: Faker::Simpsons.quote, answer: Faker::Simpsons.location)
end

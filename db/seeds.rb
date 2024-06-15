# require 'faker'
# require 'cpf_cnpj'

# Debt.destroy_all
# Person.destroy_all
# User.destroy_all

# User.create(
#   email: 'admin@admin.com',
#   password: '1234567'
# )

# User.create(
#   email: 'admin2@admin.com',
#   password: '1234567'
# )


# user_ids = []
# 50.times do |count|
#   user = User.create(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
#   user_ids << user.id
#   puts "Criando usuário: #{count}"
# end

# person_ids = []
# 100000.times do |count|
#   person = Person.create(
#     name: Faker::Name.name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     national_id: CPF.generate,
#     active: Faker::Boolean.boolean,
#     user_id: user_ids.sample
#   )
#   person_ids << person.id
#   puts "Criando pessoa: #{count}"
# end

# 15000.times do |count|
#   Debt.create(
#     person_id: person_ids.sample,
#     amount: Faker::Number.decimal(l_digits: 2),
#     observation: Faker::Lorem.sentence
#     )
#   puts "Criando conta: #{count}"
# end

# 15000.times do |count|
#   Payment.create(
#     person_id: person_ids.sample,
#     amount: Faker::Number.decimal(l_digits: 2),
#     paid_at: Faker::Date.between(from: 1.year.ago, to: Date.today)
#     )
#   puts "Criando pagamento: #{count}"
# end

200.times do
  Debt.create(
    amount: Faker::Number.between(from: 100_000, to: 200_000),
    person: Person.order('random()').first,
    observation: Faker::Lorem.paragraph
  )
end
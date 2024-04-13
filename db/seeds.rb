Payment.destroy_all
User.destroy_all
Person.destroy_all
Debt.destroy_all

User.create email: 'admin@admin.com', password: '111111'

5.times do |counter|
  puts "Creating user #{counter}"
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
  
500.times do |counter|
  puts "Inserting Person #{counter}"
    person = Person.create!(
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.phone_number,
        national_id: CPF.generate,
        active: [true, false].sample,
        user: User.order('random()').first
    )
end

1000.times do |counter|
  puts "Inserting Debt #{counter}"
    Debt.create!(
    person: Person.order('random()').first,
    amount: Faker::Number.decimal(l_digits: 2),
    observation: Faker::Lorem.sentence
    )
end

1000.times do |counter|
  puts "Inserting Payment #{counter}"
    Payment.create!(
      person: Person.order('random()').first,
      amount: Faker::Number.decimal(l_digits: 2),
      paid_at: Faker::Date.between(from: 2.years.ago, to: Date.today)
    )
end
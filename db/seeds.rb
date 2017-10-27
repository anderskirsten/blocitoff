user_one = User.create!(
  email:    'user_one@example.com',
  password: 'helloworld'
)

user_two = User.create!(
  email:    'user_two@example.com',
  password: 'helloworld'
)

user_three = User.create!(
  email:    'user_three@example.com',
  password: 'helloworld'
)

users = User.all

users.each do |user|
    5.times do
        Item.create!(
            user_id: user.id,
            name: Faker::Food.unique.dish
            )
    end
    
    2.times do
        Item.create!(
            user_id: user.id,
            name: Faker::Food.unique.dish,
            created_at: 3.months.ago
            )
    end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} todo list items created"

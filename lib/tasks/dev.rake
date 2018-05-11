namespace :dev do

  task fake_item: :environment do
    Item.destroy_all

    40.times do |i|
      Item.create!(
        title: FFaker::Sport.name,
        date: FFaker::Time.day_of_week,
        location: FFaker::Address.city,
        intro: FFaker::Lorem.paragraph,
        genre: Genre.all.sample,
        user: User.all.sample
      )
    end
    puts "created fake Items"
    puts "now have #{Item.count} Items data"
  end

  task fake_user: :environment do

  User.all.each do | user |
      user.destroy unless user.admin?
    end

    25.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@example.com",
        password: "123456"
        )
    end
    puts "New have #{User.count} users data."
  end


end
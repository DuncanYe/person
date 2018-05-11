namespace :dev do

  task fake: :environment do
    Item.destroy_all

    50.times do |i|
      Item.create!(
        title: FFaker::Sport.name,
        date: FFaker::Time.day_of_week,
        location: FFaker::Address.city,
        intro: FFaker::Lorem.paragraph,
        genre: Genre.all.sample
      )
    end
    puts "created fake Items"
    puts "now have #{Item.count} Items data"
  end
end
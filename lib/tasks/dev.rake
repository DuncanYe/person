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
        intro: FFaker::Lorem.paragraph,
        email: "#{user_name}@example.com",
        password: "123456"
        )
    end
    puts "New have #{User.count} users data."
  end

  task fake_like: :environment do
    Like.destroy_all
    100.times do
      user = User.all.sample
      item = Item.all.sample
      unless item.likes.create(user: user)
        return
      end
    end

    puts "create #{Like.count} fake likes"
  end

  task fake_follow: :environment do
    Followship.destroy_all

    User.all.each do |user|
      followings = User.all.sample(rand(2..20))
      if followings.include?(user)
        followings.delete(user)
      end
      for following in followings
        user.followships.create!(following: following)
      end
    end
    puts "create #{Followship.count} fake follow"
  end

  task fake_comment: :environment do
    Comment.destroy_all
    100.times do
      user = User.all.sample
      item = Item.all.sample
      Comment.create(
        user: user,
        item: item,
        content: FFaker::Lorem::sentence(10) 
        )
    end
    puts "create #{Comment.count} fake comment"
  end


end
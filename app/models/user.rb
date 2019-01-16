class User < ApplicationRecord

  before_create :confirmation_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/       

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :commented_items, through: :comments, source: :item

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  has_many :registers, dependent: :destroy


  def follow(other_user)
    followships.create(following_id: other_user.id)
  end
  # follow unfollow 讓 controller 直接使用
  def unfollow(other_user)
    followships.find_by(following_id: other_user.id).destroy
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
  end

  ROLE = {
    normal: '一般用戶',
    admin: '管理員'
  }

  def admin?
     self.role == "admin"
  end

  def followed?(user)
    self.followings.include?(user) 
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  # def check_user_email
  #   if current_user.email_confirmed == false
  #     flash[:alert] = "Please confirm your email address to continue"
  #     # redirect_to root_path
  #   end
  # end
  # 用 current_user 會爆掉，因為不用登入就能看見頁面

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end

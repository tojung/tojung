class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :email, presence: true
  #validates :created_at, presence: true
  #validates :updated_at, presence: true

  mount_uploader :image0, ImageUploader
  has_many :product_orders
  has_many :product_likes
  has_many :bill_comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 kakao]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.confirmed_at = Time.now.utc
      user.confirmation_token = nil
      user.skip_confirmation!
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def check_user_data
    return false if email.nil? ||
                    address_text.nil? ||
                    address_num.nil? ||
                    image0.nil? ||
                    phone_number.nil? ||
                    address_extra.nil?
    true
  end
end

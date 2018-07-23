class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable,
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

  def update_phone(phone_number)
    nil if phone_number.nil? || (phone_number == '')
    self.phone_number = phone_number
    save
  end

  def update_addresses(address_num:, address_text:, extra_address:)
    address_num = address_num.to_i
    self.address_num = address_num
    self.address_text = address_text
    self.address_extra = extra_address
    save
  end

  def check_user_data
    return false if self.email.nil? ||
                    self.address_text.nil? ||
                    self.address_num.nil? ||
                    self.phone_number.nil? ||
                    self.address_extra.nil?
    true
  end
def send_devise_notification(notification, *args)
  devise_mailer.send(notification, self, *args).deliver_later
end
end

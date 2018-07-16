class Vuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :kakao]

 #def self.new_with_session(params, session)
 # print(params)
 # print("GGGGGG")
 # super.tap do |user|
 #   if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
 #     user.email = data["email"] if user.email.blank?
 #   end
 # end
# end

 def self.from_omniauth(auth)
  print("G!")
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end 
end
end

class Notification < ApplicationRecord
  validates_presence_of :endpoint, :p256h, :auth
end

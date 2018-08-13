class MakerResponse < ApplicationRecord
  belongs_to :product
  belongs_to :maker
end

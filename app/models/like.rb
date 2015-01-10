class Like < ActiveRecord::Base
  belongs_to :photo
  validates :user_id, :uniqueness => {:scope => :photo_id}
end

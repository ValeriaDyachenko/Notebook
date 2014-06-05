class Contact < ActiveRecord::Base
  belongs_to :user
  validates :surname, presence: true
  validates :user_id, presence: true
  
end

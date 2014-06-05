class Task < ActiveRecord::Base
  belongs_to :todopage
  belongs_to :user
  validates :title, presence: true
  validates :todopage_id, presence: true

  
end

class Todosection < ActiveRecord::Base
  belongs_to :user
  has_many :todopages, dependent: :destroy
  validates :title, presence: true
  validates :user_id, presence: true
end

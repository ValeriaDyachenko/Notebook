class Notesection < ActiveRecord::Base
  belongs_to :user
  has_many :notepages, dependent: :destroy
  validates :title, presence: true
  validates :user_id, presence: true
end

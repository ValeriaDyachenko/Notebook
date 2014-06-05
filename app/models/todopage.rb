class Todopage < ActiveRecord::Base
  belongs_to :todosection
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  validates :todosection_id, presence: true
  

end

class Notepage < ActiveRecord::Base
  belongs_to :notesection
  validates :title, presence: true
  validates :notesection_id, presence: true
end

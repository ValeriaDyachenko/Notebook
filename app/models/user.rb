class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todosections, dependent: :destroy
  has_many :notesections, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :tasks, dependent: :destroy
end

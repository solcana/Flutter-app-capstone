class User < ApplicationRecord
  has_many :travel_logs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, :username, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

class TravelLog < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  has_many :comments

  validates :destination_id, :title, presence: true

end

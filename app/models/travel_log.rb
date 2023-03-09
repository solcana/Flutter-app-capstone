class TravelLog < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  has_many :comments, dependent: :destroy

  validates :destination_id, :title, presence: true

end

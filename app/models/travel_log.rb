class TravelLog < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :destination_id, :title, presence: true

end


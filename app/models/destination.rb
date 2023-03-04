class Destination < ApplicationRecord
has_many :travel_logs

  scope :beach, -> { where(category: 'beach') }
  scope :lake, -> { where(category: 'lake') }
  scope :mountain, -> { where(category: 'mountain') }
  scope :city, -> { where(category: 'city') }

validates :category, inclusion: { in: %w[beach lake mountain city], message: "must be one of 'beach', 'lake', 'mountain', or 'city'" }
end

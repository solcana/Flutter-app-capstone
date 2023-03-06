class Destination < ApplicationRecord
CATEGORIES = %w[beach lake mountain city]

has_many :travel_logs

validates :category, inclusion: { in: CATEGORIES, message: "must be one of 'beach', 'lake', 'mountain', or 'city'" }
end

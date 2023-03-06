class Destination < ApplicationRecord
CATEGORIES = %w[beach lake mountain city]

has_many :travel_logs

end

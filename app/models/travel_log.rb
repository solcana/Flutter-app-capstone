class TravelLog < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :destination_id, :title, presence: true
  validate :destination_has_category

  private

  def destination_has_category
    if destination.present? && destination.category.blank?
      errors.add(:destination_id, "must have a category")
    end
  end
end

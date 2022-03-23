class Carriage < ApplicationRecord
  belongs_to :train

  validates :top_seats, :bottom_seats, :kind, presence: true

  enum kind: %i[lux economy]
end

class Carriage < ApplicationRecord
  TYPES = %w(CoupeCarriage CVCarriage EconomyCarriage SeatCarriage)
  belongs_to :train, dependent: :delete

  validates :train, :type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number ||= self.max_number + 1
  end

  def max_number
    train.carriages.pluck(:number).max || 0
  end
end

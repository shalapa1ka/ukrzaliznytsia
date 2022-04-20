class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user, optional: true

  validates :name, presence: true
end

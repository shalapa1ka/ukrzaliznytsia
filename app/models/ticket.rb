class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  after_create :send_buy
  after_destroy :send_cancel

  scope :sorted, -> {order(updated_at: :desc)}

  def route_title
    train.route.title
  end

  private

  def send_buy
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancel
    TicketsMailer.destroy_ticket(self.user).deliver_now unless self.user.admin?
  end
end

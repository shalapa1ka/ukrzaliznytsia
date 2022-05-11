class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет' )
  end

  def destroy_ticket(user)
    @user = user
    mail(to: user.email, subject: 'Вы отменили покупку билета' )
  end
end

class NotificationsController < ApplicationController
  def show
  end

  def create
    NotificationsMailer.contact(email_params).deliver_now

    redirect_to :back, notice: "Your Email was Sent"
  end

  private

  def email_params
    params.permit(:name, :email, :message)
  end
end

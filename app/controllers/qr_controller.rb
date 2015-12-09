require 'rqrcode_png'

class QrController < ApplicationController

  def show
    @order = 
    qr_path = "https://ticketly.herokuapp.com/orders/#{@order.id}"
    @qr = RQRCode::QRCode.new(qr_path).to_img.resize(200, 200).to_data_url
  end
end

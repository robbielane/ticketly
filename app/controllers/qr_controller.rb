require 'rqrcode_png'

class QrController < ApplicationController

  def show
    @order = Order.find_by(url_hash: params[:order_hash])
  end

  def image
    @order = Order.find_by(url_hash: params[:order_hash])
    qr_path = "https://ticketly.herokuapp.com/m/orders/#{@order.url_hash}"
    @image = RQRCode::QRCode.new(qr_path).as_png(size: 200)
    send_data @image.to_blob, :type => "image/png"
  end
end

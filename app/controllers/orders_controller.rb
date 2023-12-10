class OrdersController < ApplicationController
  include Braintreeable
  before_action :authenticate_user!

  def create

    order = current_user.orders.new(order_params)

    order.order_items = current_cart.cart_items.map do |item|
      product = item.product
      quantity = item.quantity
      price = product.price

      OrderItem.new(product:, quantity:, price:)
    end

    if order.save

      nonce = params[:nonce]

      result = braintree_gateway.transaction.sale(
        amount: current_cart.total_amount,
        payment_method_nonce: nonce
      )

      if result.success?

        current_cart.destroy

        order.update(state: 'paid')

        redirect_to root_path, notice: '付款成功'
      else
        process_errors
      end
    else
      process_errors
    end
  end


  private

  def order_params
    params.require(:order).permit(:recipient, :address, :tel).merge(state: 'pending')
  end

  def process_errors
    redirect_to checkout_cart_path, alert: '系統忙碌，請重新再試'
  end
end

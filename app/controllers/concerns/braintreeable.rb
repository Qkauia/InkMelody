module Braintreeable
  def braintree_gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: "y",
      public_key: "x",
      private_key: "b",
    )
  end
end
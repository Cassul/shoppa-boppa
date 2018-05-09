class OrderFulfilledJob < ApplicationJob
  queue_as :default

  def perform(shop_domain, webhook)
    # Do something later
  end
end

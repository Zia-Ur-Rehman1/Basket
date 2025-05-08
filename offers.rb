module Offers
  class Applicator
    def initialize(offers)
      @offers = offers
    end

    def apply(items)
      @offers.sum { |offer| offer.apply(items) }
    end
  end

  class RedWidget
    def apply(items)
      return 0 if items.size < 2

			red_widgets = items.select { |item| item.code == 'R01' }
      return 0 if red_widgets.size < 2

      half_price_count = red_widgets.size / 2
      (red_widgets.first.price / 2) * half_price_count
    end
  end
end
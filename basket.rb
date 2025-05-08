class Basket
  def initialize(product, delivery_calculator, offer_applicator)
    @product = product
    @delivery_calculator = delivery_calculator
    @offer_applicator = offer_applicator
    @items = []
  end

  def add_items(product_codes)
		product_codes.each do |product_code|
			product = @product.find_by_code(product_code)
			@items << product if product
		end
  end

	def remove_items(product_codes)
		product_codes.each do |product_code|
			product = @product.find_by_code(product_code)
			@items.delete(product) if product
		end
	end
	
	def clear_items
		@items.clear
	end

  def total
		return 0 if @items.empty?

    subtotal = @items.sum(&:price)
    discount = @offer_applicator.apply(@items)
		total_cost = subtotal - discount
    delivery_cost = @delivery_calculator.calculate(total_cost)
    
    (total_cost + delivery_cost).round(2)
  end
end
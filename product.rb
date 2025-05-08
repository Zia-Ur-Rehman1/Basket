class Product
  attr_reader :code, :name, :price
	
  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

	def self.products
		@products ||= []
	end

  def self.add_product(product)
    products << product
  end

  def self.find_by_code(code)
    product = @products.find { |product| product.code == code }
    
		unless product
      puts "Warning: Product with code '#{code}' not found"
		end
		
		product
  end
end
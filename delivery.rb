module Delivery
  class Rule
    attr_reader :min, :cost

    def initialize(min:, cost:)
      @min = min
      @cost = cost
    end

    def applies_to?(amount)
      amount >= min
    end
  end

  class Calculator
    def initialize(rules)
      @rules = rules
    end

    def calculate(subtotal)
      applicable_rule = @rules.find { |rule| rule.applies_to?(subtotal) }
      applicable_rule ? applicable_rule.cost : 0      
    end
  end
end
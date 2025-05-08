# Shopping Basket System

This Ruby project models a shopping basket system that includes product management, delivery rules, and special offers. It calculates the total cost of items in the basket, including discounts and delivery charges.

## Features

- **Product Management**: Add and retrieve products by their code.
- **Delivery Rules**: Calculate delivery costs based on the subtotal.
- **Offers**: Apply discounts to specific products.
- **Basket**: Add, remove, and clear items, and calculate the total cost.

---

## Project Structure

```
basket.rb       # Manages the shopping basket and calculates the total cost.
delivery.rb     # Defines delivery rules and calculates delivery costs.
offers.rb       # Implements special offers and discounts.
product.rb      # Manages product details and product catalog.
testing.rb      # Demonstrates the usage of the system.
```

---

## Installation

1. Clone the repository:
   ```bash
   git clone [repository-url](https://github.com/Zia-Ur-Rehman1/Basket.git)
   cd basket
   ```

2. Run the `testing.rb` file to see the system in action:
   ```bash
   ruby testing.rb
   ```

---

## Usage

The `testing.rb` file demonstrates adding items to the basket and calculating the total cost:
```
Total: 37.85
Total: 54.37
Total: 60.85
Total: 98.27
Warning: Product with code 'RO1' not found
Total: 90.32
```

---

## Assumptions

1. **Product Codes Are Unique**:
   - Each product in the catalog has a unique code (e.g., `R01`, `G01`).
   - That's why I have used find_by_code

2. **Delivery Rules Are Non-Overlapping**:
   - Delivery rules are defined in such a way that only one rule applies to a given subtotal.

3. **Offers Are Applied Independently**:
   - Each offer is applied independently of others

4. **No Negative Totals**:
   - Discounts cannot exceed the subtotal, ensuring that the total cost is never negative.

5. **Delivery Cost Is Always Non-Negative**:
   - Delivery costs are calculated based on the subtotal after discounts, and they default to `0` if no rule applies.

6. **Red Widget Offer**:
   - The "Red Widget" (`R01`) offer applies to every second item in the basket, and the discount is calculated as half the price of one Red Widget.

---
## Code Overview

### 1. **Product Management** (product.rb)
- **Class**: `Product`
  - Attributes: `code`, `name`, `price`.
  - Methods:
    - `add_product`: Adds a product to the catalog.
    - `find_by_code`: Finds a product by its code.

### 2. **Delivery Rules** (delivery.rb)
- **Class**: `Rule`
  - Represents a delivery rule with a minimum order amount (`min`) and a delivery cost (`cost`).
- **Class**: `Calculator`
  - Calculates the delivery cost based on the subtotal using the defined rules.

### 3. **Offers** (offers.rb)
- **Class**: `Applicator`
  - Applies a list of offers to the items in the basket.
- **Class**: `RedWidget`
  - Applies a discount for every second "Red Widget" (`R01`).

### 4. **Basket** (basket.rb)
- **Class**: `Basket`
  - Manages items in the basket.
  - Methods:
    - `add_items`: Adds products to the basket by their codes.
    - `remove_items`: Removes products from the basket by their codes.
    - `clear_items`: Clears all items from the basket.
    - `total`: Calculates the total cost, including discounts and delivery charges.

---

## Edge Cases

1. **Invalid Product Codes**:
   - If a product code does not exist, a warning is displayed, and the product is not added to the basket.

2. **Empty Basket**:
   - If the basket is empty, the total cost is `0`.

3. **Delivery Rules**:
   - If no delivery rule applies, the delivery cost defaults to `0`.

4. **Offers**:
   - Discounts are applied only if the conditions for the offer are met (e.g., at least two "Red Widgets" for the `RedWidget` offer).

---

## Testing

Currently, the project does not include automated tests. To add tests, consider using a framework like [RSpec](https://rspec.info/) or [Minitest](https://github.com/seattlerb/minitest).

---

## Future Improvements

1. **Automated Tests**:
   - Add unit tests for all classes and methods.

2. **Performance Optimization**:
   - Optimize delivery rule lookups using a hash.

3. **Error Handling**:
   - Improve error handling for invalid inputs and edge cases.

4. **Scalability**:
   - Use a database or external configuration for products and rules.

---

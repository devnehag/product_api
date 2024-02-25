require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is not valid without a valid name" do
    product = Product.new(price: 2.99)
    expect(product).to_not be_valid
  end

  it "is not valid with a duplicate name" do
    Product.create(name: "Apple", price: 1.99)
    product = Product.new(name: "Apple", price: 2.99)
    expect(product).to_not be_valid
  end

  it "is not valid with a name longer than 50 characters" do
    product = Product.new(name: "Grapes" * 10, price: 2.99)
    expect(product).to_not be_valid
  end

  it "is not valid without a valid price" do
    product = Product.new(name: "Orange")
    expect(product).to_not be_valid
  end

  it "is not valid with a non-numerical price" do
    product = Product.new(name: "Banana", price: "abc")
    expect(product).to_not be_valid
  end

  it "is not valid with a price less than or equal to 0" do
    product = Product.new(name: "Pineapple", price: 0)
    expect(product).to_not be_valid
  end

  it "is valid with valid attributes" do
    product = Product.new(name: "Valid Product", price: 3.99)
    expect(product).to be_valid
  end
end


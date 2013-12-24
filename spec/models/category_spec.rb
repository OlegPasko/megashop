require 'spec_helper'

describe Category do
  let!(:category) {@category = Category.create(name: 'Category name', position: 2)}
  subject { @category }

  describe 'Associations'
    before { @product = category.products.build(name: 'Product title', price: 666.15) }
    it 'should have product' do
      @product.should be_valid
    end
    it 'should have many products' do
      t = Category.reflect_on_association(:products)
      t.macro.should == :has_many
    end
  describe 'Have all fields' do
    it { should respond_to(:name) }
    it { should respond_to(:position) }
  end
  describe 'Have uniq name' do
    duplicate_category = Category.create(name: @category.name)
    duplicate_category.should_not be_valid
  end

  describe 'Order by position' do
    let!(:first_category) { Category.create(name: 'First category name', position: 1) }

    it 'should be in the right order' do
      expect([category, first_category].sorted).to eq [first_category, category]
    end
  end

end
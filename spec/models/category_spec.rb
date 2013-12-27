require 'spec_helper'

describe Category do
  let(:category) { @category = Category.create(name: 'Category name', position: 2) }
  subject { @category }

  describe 'should have all necessary fields' do
    it { should respond_to(:name) }
    it { should respond_to(:position) }
  end

  describe 'associations' do
    before { @product = category.products.build(name: 'Product name', price: 20, description: 'Some product description', image: '/public/products/1/image.jpg') }
    it 'product should be valid' do
      @product.should be_valid
    end
    it 'should have many products' do
      t = Category.reflect_on_association(:products)
      t.macro.should == :has_many
    end
  end

  describe 'with duplicate name should be invalid' do
    pending 'create test'
  end

  describe '#order' do
    let(:first_category) { Category.create(name: 'First cat name', position: 1) }
    it 'should be right' do
      expect([category, first_category].sorted).to eq [first_category, category]
    end
  end

end

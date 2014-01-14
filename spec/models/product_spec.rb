require 'spec_helper'

describe Product do
  let!(:product) { @product = Product.create(name: 'Product name', price: 20, description: 'Some product description', category_id: 2, image: '/public/products/1/image.jpg') }
  subject { @product }

  describe 'should have all necessary fields' do
    it { should respond_to(:name) }
    it { should respond_to(:price) }
    it { should respond_to(:description) }
    it { should respond_to(:image) }
    it { should respond_to(:category_id) }
  end

  describe 'should have right associations' do
    t = Product.reflect_on_association(:category)
    t.macro.should == :belongs_to
  end

  it { should be_valid }

  describe 'should not be valid' do
    describe 'with too long name' do
      before { @product.name = 'a'*201 }
      it { should_not be_valid}
    end
    describe 'without name' do
      before { @product.name = '' }
      it { should_not be_valid}
    end
    describe 'with negative price' do
      before { @product.price = -1 }
      it { should_not be_valid}
    end
    describe 'with not fixnum in price' do
      before { @product.price = 'trololo' }
      it { should_not be_valid}
    end
    describe 'without category' do
      before { @product.category_id = nil }
      it { should_not be_valid}
    end
  end

end

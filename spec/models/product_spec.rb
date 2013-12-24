require 'spec_helper'

describe Product do
  let!(:product) {@product = Product.create(name: 'Product title', price: 666.15, category_id: 1)}

  subject { @product }

  context 'Have all fields' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:price) }
    it { should respond_to(:image) }
    it { should respond_to(:category_id) }
  end

  context 'Right associations' do
    it { should belongs_to(:category) }
  end

  it { should be_valid }

  context 'Not be valid' do
    context 'when name is not present' do
      before { @product.name = '' }
      it { should_not be_valid }
    end
    context 'when name length have more 100 symbols' do
      before { @product.name = 'a' * 101 }
      it { should_not be_valid }
    end
    context 'when price is not present' do
      before { @product.price = '' }
      it { should_not be_valid }
    end
    context 'when price is not fixnum' do
      before { @product.price = 'asdasd' }
      it { should_not be_valid }
    end
    context 'when price is negative' do
      before { @product.price = -1 }
      it { should_not be_valid }
    end
    context 'when we have no category' do
      before { @product.category_id = nil }
      it { should_not be_valid }
    end
  end
end
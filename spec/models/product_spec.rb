require 'spec_helper'

describe Product do
  let!(:product) {@product = Product.create(name: 'Product title', price: 666.15)}

  context 'Necessary fields' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:price) }
    it { should respond_to(:image) }
  end

  context 'Right associations' do
    pending
  end

  it { should be_valid }

  context 'Not be valid' do
    describe 'when name is not present' do
      before { @product.name = '' }
      it { should_not be_valid }
    end
    describe 'when name length have more 100 symbols' do
      before { @product.name = 'a' * 101 }
      it { should_not be_valid }
    end

    describe 'when price is not present' do
      before { @product.price = '' }
      it { should_not be_valid }
    end
    describe 'when price is not fixnum' do
      before { @product.price = 'asdasd' }
      it { should_not be_valid }
    end
  end
end

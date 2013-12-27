#encoding: utf-8
require 'spec_helper'

describe 'Pages' do
  let(:product) { @product = Product.create(name: 'Product name', price: 20, description: 'Some product description', category_id: 2, image: '/public/products/1/image.jpg') }
  subject { @product }
  describe 'index page' do
    before { visit root_path }
    it { should have_title('Megashop') }
    it "should have content 'Товары'" do
      expect(page).to have_content('Товары')
    end
    it 'should have products listing' do
      expect(page).to have_selector('a', text: @product.name)
    end
    it 'product link should lead to product page' do
      click_link @product.name
      expect(page).to have_title(@product.name)
    end
  end
  describe 'product page' do
    before { visit product_path(@product) }
    it 'should have title based on product name' do
      expect(page).to have_title(@product.name)
    end
    it 'should have url based on product name' do
      pending 'url with transliterated product name'
      # to_param + russian gem... /products/4-sinie-noski
    end
  end

end
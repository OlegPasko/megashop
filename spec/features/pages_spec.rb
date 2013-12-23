# encoding: utf-8
require 'spec_helper'

describe 'Pages' do
  let(:product) { @product = Product.create(id: 1, name: 'Product title', price: 666.15) }
  let(:shop_name) { 'Megashop' }

  describe 'Home page' do
    before { visit root_path }
    it "should have the content 'Товары'" do
      expect(page).to have_content('Товары')
    end
    it 'should have products listing' do
      expect(page).to have_content(@product.name)
      expect(page).to have_selector('a', text: @product.name)
    end
    it 'product link lead to product page' do
      click_link @product.name
      expect(page).to have_title(@product.name)
    end
  end

  describe 'Product page' do
    before { visit product_path(@product) }
    it 'should have title based on name' do
      expect(page).to have_title(@product.name)
    end
    it 'should have url based on name' do
      pending
    end
  end

  describe 'Every page' do
    it 'should have shop name in title' do
      visit root_path
      expect(page).to have_title(shop_name)
      visit product_path(@product)
      expect(page).to have_title(shop_name)
    end
  end
end
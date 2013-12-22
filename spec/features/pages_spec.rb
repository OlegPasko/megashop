# encoding: utf-8
require 'spec_helper'

describe 'Pages' do

  describe 'Home page' do
    it "should have the content 'Товары'" do
      visit root_path
      expect(page).to have_content('Товары')
    end
  end
end
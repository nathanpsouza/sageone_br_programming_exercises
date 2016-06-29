require 'rails_helper'
feature 'List products' do
  let(:products){ FactoryGirl.create_list(:product, 3) }
  
  scenario 'see a list of products' do
    products

    visit root_path
    
    products.each do |product|
      expect(page).to have_content(product.name)
    end
  end
end

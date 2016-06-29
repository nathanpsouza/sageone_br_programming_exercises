require 'rails_helper'
feature 'Show product details' do
  let(:product){FactoryGirl.create(:product)}
  
  scenario 'See product attributes' do
    product
    visit root_path
    
    within "#product_#{product.id}" do
      click_link 'Ver'
    end

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end
end

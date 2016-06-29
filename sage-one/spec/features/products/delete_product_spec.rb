require 'rails_helper'
feature 'Delete product' do
  
  let(:product){FactoryGirl.create(:product)}
  scenario 'Remove from database' do
    product
    visit root_path
    
    within "#product_#{product.id}" do
      click_link 'Remover'
    end

    expect(page).to_not have_content(product.name)
  end
end

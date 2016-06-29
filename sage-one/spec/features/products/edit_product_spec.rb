require 'rails_helper'
feature 'Edit product' do
  let(:attributes){ FactoryGirl.attributes_for(:product) }
  let(:product){FactoryGirl.create(:product)}
  
  scenario 'With valid data' do
    product
    visit root_path
    
    within "#product_#{product.id}" do
      click_link 'Editar'
    end

    fill_in 'Nome', with: attributes[:name]
    fill_in 'Descrição', with: attributes[:description]
    fill_in 'Valor', with: attributes[:value]

    click_button 'Salvar'

    expect(page).to have_content(attributes[:name])
  end
end

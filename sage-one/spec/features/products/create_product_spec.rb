require 'rails_helper'
feature 'Create product' do
  let(:product){ FactoryGirl.attributes_for(:product) }

  scenario 'With valid data' do
    visit root_path
    click_link 'Cadastrar produto'
    fill_in 'Nome', with: product[:name]
    fill_in 'Descrição', with: product[:description]
    fill_in 'Valor', with: product[:value]

    click_button 'Salvar'

    expect(page).to have_content(product[:name])
    expect(page).to have_content(product[:description])
  end
end

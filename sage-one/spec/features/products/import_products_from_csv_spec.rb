require 'rails_helper'
feature 'Import products from csv', js: true do  
  let(:csv) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }
  let(:invalid) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'invalid_format.csv') }

  scenario 'upload file' do
    visit root_path

    click_button 'Importar produtos'

    attach_file('Arquivo', csv)

    click_button 'Importar'
    
    ["Carteira Multi-uso em Couro", "Carteira Feminino", "Porta Moedas em Couro"].each do |product|
      expect(page).to have_content(product)
    end
  end

  scenario 'see error message when file is not valid' do
    visit root_path

    click_button 'Importar produtos'

    attach_file('Arquivo', invalid)

    click_button 'Importar'
    
    expect(page).to have_content('Arquivo em formato inválido')
  end
end

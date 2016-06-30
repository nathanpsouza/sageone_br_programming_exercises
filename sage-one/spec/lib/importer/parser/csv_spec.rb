require 'rails_helper'
describe Importer::Base do 
  let(:file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }

  subject { Importer::Parser::Csv.new(file) }

  describe '.initialize' do
    it 'assign a file for importer' do
      expect(subject.file_path).to eq(file)
    end
  end

  describe '#load_records' do
    it 'parse csv and returns a hash with records' do
      expect(subject.load_records.count).to eq(3)
      expect(subject.load_records).to match_array([
        {name: "Carteira Multi-uso em Couro", category: "Diversos", external_code: "1", description: "Carteira Multi-uso em Couro", barcode: "31002", ncm: "11122233", unit: "kg", value: "100", quantity: ""}, 
        {name: "Carteira Feminino", category: "Diversos", external_code: "CF-10", description: "Carteira Feminino", barcode: "1010", ncm: "", unit: "UN", value:"142.5", quantity: ""}, 
        {name: "Porta Moedas em Couro", category: "Diversos", external_code: "PM - 4", description: "Porta Moedas em Couro", barcode: "31005", ncm: "", unit: "UN", value: "50", quantity: ""}
      ])
    end
  end
end
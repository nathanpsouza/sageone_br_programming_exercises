require 'rails_helper'
describe Importer::Parser::Csv do 
  let(:file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }
  let(:invalid_file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'invalid_format.csv') }

  subject { Importer::Parser::Csv.new(file) }
  let(:invalid) { Importer::Parser::Txt.new(invalid_file) }
  

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

  describe '#valid_file?' do
    it 'returns true if file has valid header' do
      expect(invalid.valid_file?).to eq(false)
      expect(subject.valid_file?).to eq(true)
    end
  end
end
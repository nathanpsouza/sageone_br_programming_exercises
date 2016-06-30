require 'rails_helper'
describe Importer::Base do 
  let(:csv) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }
  let(:txt) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'youdoinvoice_product_file.txt') }

  let(:csv_importer) { Importer::Base.new(csv) }
  let(:txt_importer) { Importer::Base.new(txt) }

  describe '.initialize' do
    it 'assign a file for importer' do
      expect(csv_importer.file_path).to eq(csv)
    end

    it 'should set parser' do
      expect_any_instance_of(Importer::Base).to receive(:get_parser)
      Importer::Base.new(csv)
    end

    it 'should load correct parser to @parser' do
      expect(csv_importer.parser).to be_a(Importer::Parser::Csv)
      expect(txt_importer.parser).to be_a(Importer::Parser::Txt)
    end
  end

  describe '#csv?' do
    it 'return true for a valid csv' do
      expect(csv_importer.csv?).to eq(true)
    end

    it 'return false for not csv file' do
      expect(txt_importer.csv?).to eq(false)
    end
  end

  describe '#import' do
    it 'save products in database' do
      expect{
        csv_importer.import
      }.to change(Product, :count).by(3)
      
      expect{
        txt_importer.import
      }.to change(Product, :count).by(4)
    end
  end
end
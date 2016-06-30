require 'rails_helper'
describe Importer::Base do 
  let(:csv) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }
  let(:invalid_product_on_csv) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_with_invalid_product.csv') }
  let(:txt) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'youdoinvoice_product_file.txt') }
  let(:invalid_file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'invalid_format.txt') }

  let(:csv_importer) { Importer::Base.new(csv) }
  let(:txt_importer) { Importer::Base.new(txt) }
  let(:invalid_importer) { Importer::Base.new(invalid_file) }

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

    it 'not save registers if any product is invalid' do
      importer = Importer::Base.new(invalid_product_on_csv)
      expect{
        importer.import
      }.to raise_error "Invalid record"
    end

    it 'raise InvalidImportFile if file is not valid' do

      expect {
        invalid_importer.import
      }.to raise_error Importer::Parser::InvalidImportFile
    end
  end
end
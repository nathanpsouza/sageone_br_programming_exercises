require 'rails_helper'
describe Importer::Base do 
  let(:file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'youdoinvoice_product_file.txt') }

  subject { Importer::Parser::Txt.new(file) }

  describe '.initialize' do
    it 'assign a file for importer' do
      expect(subject.file_path).to eq(file)
    end
  end

  describe '#load_records' do
    it 'parse csv and returns a hash with records' do
      expect(subject.load_records.count).to eq(4)
      expect(subject.load_records).to match_array([
        {name:"Produto teste 1", category:"", external_code:"123", description:"Produto teste 1", barcode:"", ncm:"01061100", unit:nil, value:0, quantity:nil}, 
        {name:"Produto teste 2", category:"", external_code:"123A", description:"Produto teste 2", barcode:"", ncm:"01061100", unit:nil, value:0, quantity:nil}, 
        {name:"Produto teste 3", category:"", external_code:"123B", description:"Produto teste 3", barcode:nil, ncm:nil, unit:nil, value:0, quantity:nil}, 
        {name:"Produto teste 4", category:"", external_code:"123C", description:"Produto teste 4", barcode:nil, ncm:nil, unit:nil, value:0, quantity:nil}
      ])
    end
  end
end
require 'rails_helper'
describe Importer::Parser::Base do 
  let(:file) { File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') }

  subject { Importer::Parser::Base.new(file) }

  describe '.initialize' do
    it 'assign a file for importer' do
      expect(subject.file_path).to eq(file)
    end
  end

  describe '#normalize_decimal' do
    it 'return zero when number is nil' do
      expect(subject.normalize_decimal(nil)).to eq(0)
    end

    it 'replace comma for dot' do
      expect(subject.normalize_decimal('12,1')).to eq('12.1')
    end
  end
end
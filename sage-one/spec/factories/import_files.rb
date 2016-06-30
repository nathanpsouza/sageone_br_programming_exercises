FactoryGirl.define do
  factory :import_file do
    file { Rack::Test::UploadedFile.new(
      File.open( File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') ) 
    ) }
  end
end

FactoryGirl.define do
  factory :import_file do
    file { Rack::Test::UploadedFile.new(
      File.open( File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') ) 
    ) }

    factory :invalid_import_file do
      file { Rack::Test::UploadedFile.new(
      File.open( File.join(Rails.root, 'spec', 'support', 'product', 'import', 'invalid_format.csv') ) 
    ) }
    end
  end
end

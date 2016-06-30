FactoryGirl.define do
  factory :import_file do
    file { File.new( File.join(Rails.root, 'spec', 'support', 'product', 'import', 'bluebill_product_file.csv') ) }
  end
end

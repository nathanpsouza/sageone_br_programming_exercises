# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  category      :string
#  external_code :string
#  description   :text
#  barcode       :string
#  ncm           :string
#  unit          :string
#  value         :decimal(8, 2)
#  quantity      :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :value, numericality: true

  
end

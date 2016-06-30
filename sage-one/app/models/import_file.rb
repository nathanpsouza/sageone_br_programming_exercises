# == Schema Information
#
# Table name: import_files
#
#  id         :integer          not null, primary key
#  file       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImportFile < ActiveRecord::Base
  validates :file, presence: true

  mount_uploader :file, ImportFileUploader
end

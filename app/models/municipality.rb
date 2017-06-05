# == Schema Information
#
# Table name: municipalities
#
#  id         :integer          not null, primary key
#  code       :integer
#  name       :string
#  status     :integer
#  region_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Municipality < ApplicationRecord
  include Tokenable

  belongs_to :region
end

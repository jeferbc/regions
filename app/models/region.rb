# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  code       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ApplicationRecord
  include Tokenable
  
  has_many :municipalities
end

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

require 'test_helper'

class MunicipalityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

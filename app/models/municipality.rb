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

  validates :name, presence: true

  after_initialize :set_default_status
  enum status: [:active, :inactive]

  def inactive_status
    self.region.municipalities.delete(self)
  end

  private
    def set_default_status              # set status active by default
      self.status ||= :active
    end

    def self.delete_municipalities(municipality_ids)
      municipality_ids.each do |municipality|
        Municipality.find(municipality).delete
      end
    end
end

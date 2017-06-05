module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.code = loop do
      random_token = SecureRandom.random_number(10000)
      break random_token unless self.class.exists?(code: random_token)
    end
  end
end

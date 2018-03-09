# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord

  validates :name, presence: true

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(8)
  end
end

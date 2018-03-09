# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string
#  email             :string
#  phone_number      :string
#  first_name        :string
#  last_name         :string
#  phone_verified    :boolean          default(FALSE), not null
#  email_verified    :boolean          default(FALSE), not null
#  password_digest   :string
#  banned            :boolean          default(FALSE), not null
#  profile_image_url :string
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  token             :string
#

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, if: lambda { self.status.to_sym != :onboarding }
  validates :phone_number, presence: true, uniqueness: true, if: lambda { self.status.to_sym != :onboarding }
  validates :first_name, presence: true, if: lambda { self.status.to_sym != :onboarding }
  validates :last_name, presence: true, if: lambda { self.status.to_sym != :onboarding }
  validates :phone_verified, inclusion: { in: [true] }, if: lambda { self.status.to_sym != :onboarding }

  before_create :set_initial_status, :generate_token

  enum status: {
    onboarding: 100,
    complete: 200,
    deactivated: 300
  }

  def set_initial_status
    self.status = :onboarding
  end

  def generate_token
    token_unique = false
    while !token_unique
      token = SecureRandom.hex(8)
      token_unique = User.where(token: token).count == 0
    end
    self.token = token
  end

  def resurrect_if_deactivated
    if self.status.to_sym == :deactivated
      self.update(status: :complete)
    end
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email_address, presence: true
  validates :email_address, uniqueness: true
  validates :password_digest, presence: true

  # NIST SP 800-63B-4 floor for password-only auth (no MFA here): 15 chars,
  # no composition rules. 8 chars in dev/test keeps seeded fixture passwords short.
  PASSWORD_MIN_LENGTH = Rails.env.production? ? 15 : 8
  validates :password, length: {minimum: PASSWORD_MIN_LENGTH}, allow_nil: true

  normalizes :first_name, :last_name, with: ->(v) { v.strip }
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def display_name
    "#{first_name} #{last_name}"
  end
end

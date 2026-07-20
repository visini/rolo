class Group < ApplicationRecord
  has_many :group_memberships, dependent: :restrict_with_exception
  has_many :people, through: :group_memberships

  scope :ordered, -> { order(:name) }

  validates :name, presence: true
  normalizes :name, with: ->(attribute) { attribute.strip }
end

class Note < ApplicationRecord
  belongs_to :person

  scope :ordered, -> { order(created_at: :desc) }

  validates :title, :body, presence: true
  normalizes :title, :body, with: ->(attribute) { attribute.strip }
end

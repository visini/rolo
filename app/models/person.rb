class Person < ApplicationRecord
  has_many :group_memberships, dependent: :restrict_with_exception
  has_many :groups, through: :group_memberships
  has_many :notes, dependent: :restrict_with_exception

  scope :ordered, -> { order(:first_name, :last_name) }
  scope :favorites, -> { where(favorite: true) }
  scope :upcoming_birthdays, -> {
    where.not(birthday_day: nil, birthday_month: nil).select do |person|
      person.birthday.change(year: Date.current.year).between?(Date.current, Date.current + 4.weeks)
    end
  }
  scope :ordered_birthday, -> { order(Arel.sql("birthday_month ASC NULLS FIRST, birthday_day ASC NULLS FIRST")) }

  validates :first_name, :last_name, presence: true
  validates :birthday_day, :birthday_month, :birthday_year, numericality: {only_integer: true, greater_than: 0, allow_nil: true}
  normalizes :first_name, :last_name, with: ->(attribute) { attribute.strip }

  def name
    "#{first_name} #{last_name}"
  end

  def birthday
    return unless birthday_day && birthday_month

    Date.new(birthday_year || Date.current.year, birthday_month, birthday_day)
  end

  def age
    return unless birthday_year

    age = Date.current.year - birthday.year
    age -= 1 if Date.current < birthday.change(year: Date.current.year)
    age
  end
end

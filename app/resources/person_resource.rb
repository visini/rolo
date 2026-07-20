# frozen_string_literal: true

class PersonResource < ApplicationResource
  attributes :id, :first_name, :last_name, :favorite
  attributes :birthday_day, :birthday_month, :birthday_year

  typelize name: :string
  attribute(:name) { it.name }

  typelize age: {type: :number, nullable: true}
  attribute(:age) { it.age }

  typelize birthday: {type: :string, nullable: true}
  attribute(:birthday) { it.birthday&.to_s }
end

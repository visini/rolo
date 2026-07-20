# frozen_string_literal: true

class PagesHomeResource < ApplicationResource
  has_one :current_user, resource: UserResource
  has_many :upcoming_birthdays, resource: PersonResource
end

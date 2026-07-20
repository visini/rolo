# frozen_string_literal: true

class PeopleEditResource < ApplicationResource
  has_one :person, resource: PersonResource
end

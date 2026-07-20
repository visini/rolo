# frozen_string_literal: true

class PeopleNewResource < ApplicationResource
  has_one :person, resource: PersonResource
end

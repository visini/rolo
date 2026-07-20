# frozen_string_literal: true

class PeopleIndexResource < ApplicationResource
  has_many :people, resource: PersonResource
end

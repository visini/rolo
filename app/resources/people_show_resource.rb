# frozen_string_literal: true

class PeopleShowResource < ApplicationResource
  has_one :person, resource: PersonResource
end

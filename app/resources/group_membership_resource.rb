# frozen_string_literal: true

class GroupMembershipResource < ApplicationResource
  attributes :id

  has_one :person, resource: PersonResource
end

# frozen_string_literal: true

class GroupsShowResource < ApplicationResource
  has_one :group, resource: GroupResource
  has_many :available_people, resource: PersonResource
end

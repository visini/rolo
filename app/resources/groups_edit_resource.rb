# frozen_string_literal: true

class GroupsEditResource < ApplicationResource
  has_one :group, resource: GroupResource
end

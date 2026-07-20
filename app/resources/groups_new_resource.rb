# frozen_string_literal: true

class GroupsNewResource < ApplicationResource
  has_one :group, resource: GroupResource
end

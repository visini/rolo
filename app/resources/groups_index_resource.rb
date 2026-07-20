class GroupsIndexResource < ApplicationResource
  has_many :groups, resource: GroupResource
end

# frozen_string_literal: true

class GroupResource < ApplicationResource
  attributes :id, :name

  has_many :group_memberships, resource: GroupMembershipResource
end

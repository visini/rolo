# frozen_string_literal: true

class GroupMembershipsController < InertiaController
  def create
    group = Group.find(params[:group_id])
    group.group_memberships.create(group_membership_params)
    redirect_to group_path(group)
  end

  def destroy
    membership = GroupMembership.find(params[:id])
    group = membership.group
    membership.destroy
    redirect_to group_path(group)
  end

  private

  def group_membership_params
    params.expect(group_membership: [:person_id])
  end
end

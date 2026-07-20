# frozen_string_literal: true

class GroupsController < InertiaController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = Group.ordered.includes(group_memberships: :person)
  end

  def show
    @available_people = Person.ordered.where.not(id: @group.people.select(:id))
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path, inertia: {errors: inertia_errors(@group)}
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      redirect_to edit_group_path(@group), inertia: {errors: inertia_errors(@group)}
    end
  end

  private

  def set_group
    @group = Group.includes(group_memberships: :person).find(params[:id])
  end

  def group_params
    params.expect(group: [:name])
  end
end

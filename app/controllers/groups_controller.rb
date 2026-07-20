class GroupsController < InertiaController
  def index
    @groups = Group.ordered.includes(:people)
  end
end

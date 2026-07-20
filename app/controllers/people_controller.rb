# frozen_string_literal: true

class PeopleController < InertiaController
  def index
    @people = Person.ordered
  end

  def show
    @person = Person.find(params[:id])
  end
end

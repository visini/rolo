# frozen_string_literal: true

class PeopleController < InertiaController
  before_action :set_person, only: [:edit, :update]

  def index
    @people = Person.ordered
  end

  def show
    @person = Person.find(params[:id])
    @notes = @person.notes.ordered
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      redirect_to new_person_path, inertia: {errors: inertia_errors(@person)}
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      redirect_to edit_person_path(@person), inertia: {errors: inertia_errors(@person)}
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.expect(person: [:first_name, :last_name, :favorite, :birthday_day, :birthday_month, :birthday_year])
  end
end

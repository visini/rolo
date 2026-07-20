# frozen_string_literal: true

class NotesController < InertiaController
  before_action :set_note, only: [:edit, :update]

  def create
    person = Person.find(params[:person_id])
    note = person.notes.new(note_params)
    if note.save
      redirect_to person_path(person)
    else
      redirect_to person_path(person), inertia: {errors: inertia_errors(note)}
    end
  end

  def edit
    @person = @note.person
  end

  def update
    if @note.update(note_params)
      redirect_to person_path(@note.person)
    else
      redirect_to edit_person_note_path(@note.person, @note), inertia: {errors: inertia_errors(@note)}
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.expect(note: [:title, :body])
  end
end

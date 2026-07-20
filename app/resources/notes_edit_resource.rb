# frozen_string_literal: true

class NotesEditResource < ApplicationResource
  has_one :note, resource: NoteResource
  has_one :person, resource: PersonResource
end

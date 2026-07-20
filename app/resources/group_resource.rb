class GroupResource < ApplicationResource
  attributes :id, :name

  has_many :people, resource: PersonResource
end

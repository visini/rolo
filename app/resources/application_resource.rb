# frozen_string_literal: true

class ApplicationResource
  include Alba::Resource

  module ResourceHelper
    def self.extended(base)
      base.extend(Typelizer::DSL)
      base.extend(Alba::Inertia::Resource)
    end
  end

  helper ResourceHelper

  transform_keys :lower_camel
end

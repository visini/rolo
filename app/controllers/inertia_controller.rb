# frozen_string_literal: true

class InertiaController < ApplicationController
  include Alba::Inertia::Controller

  inertia_config default_render: true

  inertia_share locale: -> { I18n.locale.to_s }

  rescue_from StandardError, with: :inertia_error_page

  private

  # In local environments this re-raises so development keeps the debug page
  # and tests keep 404s via the :rescuable exception middleware.
  def inertia_error_page(exception)
    raise exception if Rails.env.local?

    status = ActionDispatch::ExceptionWrapper.new(nil, exception).status_code
    render inertia: "errors/show", props: {status:}, status:
  end

  def inertia_errors(record)
    record.errors.messages.transform_keys { |key| key.to_s.camelize(:lower) }
  end
end

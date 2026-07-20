# frozen_string_literal: true

require "prosopite/middleware/rack"
Rails.configuration.middleware.use(Prosopite::Middleware::Rack)

# frozen_string_literal: true

require_relative "../frontend_fixtures/exporter"

namespace :frontend do
  namespace :fixtures do
    desc "Export named Oaken records as TypeScript fixtures (requires RAILS_ENV=test)"
    task export: :environment do
      unless Rails.env.test?
        abort "Run with RAILS_ENV=test — this task truncates the database before seeding."
      end

      exporter = FrontendFixtures::Exporter.new
      puts "Replanting seed data..."
      exporter.run.each { |path| puts "  Written: #{path}" }
    end
  end
end

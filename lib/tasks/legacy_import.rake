require "json"
require "open3"

namespace :legacy do
  desc "Import people, groups, group memberships, and notes from the legacy sqlite snapshot (live only)"
  task import: :environment do
    abort "Only run this against RAILS_ENV=live." unless Rails.env.live?

    snapshot_path = Rails.root.join("rolo-snapshot-2026-07-19.sqlite3")
    abort "Snapshot not found at #{snapshot_path}" unless snapshot_path.exist?

    fetch = ->(table) {
      json, status = Open3.capture2("sqlite3", "-json", snapshot_path.to_s, "SELECT * FROM #{table}")
      raise "Failed to read #{table} from snapshot" unless status.success?
      JSON.parse(json.presence || "[]")
    }

    ActiveRecord::Base.transaction do
      Note.delete_all
      GroupMembership.delete_all
      Group.delete_all
      Person.delete_all

      person_by_legacy_id = fetch.call("contacts").to_h do |row|
        person = Person.create!(
          first_name: row["first_name"],
          last_name: row["last_name"],
          birthday_day: row["birthday_day"],
          birthday_month: row["birthday_month"],
          birthday_year: row["birthday_year"],
          favorite: row["favorite"] == 1,
          created_at: row["created_at"],
          updated_at: row["updated_at"]
        )
        [row["id"], person]
      end

      group_by_legacy_id = fetch.call("groups").to_h do |row|
        group = Group.create!(name: row["name"], created_at: row["created_at"], updated_at: row["updated_at"])
        [row["id"], group]
      end

      fetch.call("group_memberships").each do |row|
        GroupMembership.create!(
          person: person_by_legacy_id.fetch(row["contact_id"]),
          group: group_by_legacy_id.fetch(row["group_id"]),
          created_at: row["created_at"],
          updated_at: row["updated_at"]
        )
      end

      fetch.call("notes").each do |row|
        Note.create!(
          person: person_by_legacy_id.fetch(row["contact_id"]),
          title: row["title"],
          body: row["body"],
          created_at: row["created_at"],
          updated_at: row["updated_at"]
        )
      end

      puts "Imported #{person_by_legacy_id.size} people, #{group_by_legacy_id.size} groups, " \
        "#{GroupMembership.count} memberships, #{Note.count} notes."
    end
  end
end

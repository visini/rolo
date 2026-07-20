# frozen_string_literal: true

Typelizer.configure do |config|
  config.types_import_path = "@/types"

  config.plugin_configs = {
    alba: {
      ts_mapper: {
        # "company_country_codes" => {type: "Array<CompanyCountryCode>"},
        # "company_industries" => {type: "Array<CompanyIndustry>"}
      }
    }
  }

  config.routes.enabled = true
  config.routes.output_dir = Rails.root.join("app/javascript/routes")
  config.routes.exclude = [/^\/rails\//, /^\/active_storage\//, /^\/action_mailbox\//, /^\/up$/]
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Method

  before_action :set_paper_trail_whodunnit

  allow_browser versions: :modern

  helper_method :current_user

  private

  def current_user
    User.first # todo: temporary
  end
end

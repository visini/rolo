# frozen_string_literal: true

class PagesController < InertiaController
  def home
    @current_user = current_user
  end
end

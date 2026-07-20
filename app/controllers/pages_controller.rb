# frozen_string_literal: true

class PagesController < InertiaController
  def home
    @current_user = current_user
    @upcoming_birthdays = Person.ordered_birthday.upcoming_birthdays
  end
end

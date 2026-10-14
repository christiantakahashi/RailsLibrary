class PagesController < ApplicationController
  def home
    @today = Date.today
  end

  def about
  end
end

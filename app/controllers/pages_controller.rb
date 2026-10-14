class PagesController < ApplicationController
  def home
    @today = Date.today
  end
end

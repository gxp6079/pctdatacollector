class StaticPagesController < ApplicationController

  load_and_authorize_resource

  def home
    @static_pages = StaticPage.new("Welcome")
  end
end

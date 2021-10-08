class HomepagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @popular = Vote.popular
  end
end

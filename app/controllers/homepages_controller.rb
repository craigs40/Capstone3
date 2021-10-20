class HomepagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @popular = Vote.popular
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :category_id)
  end
end

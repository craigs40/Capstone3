class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @article = Article.find(params[:id])
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to @category, notice: 'Category Saved!'
    else
      render :new, alert: 'Category could not be saved.'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :category_id)
  end
end

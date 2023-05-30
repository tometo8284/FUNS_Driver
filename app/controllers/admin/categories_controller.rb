class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
       redirect_to admin_categories_path
       flash[:notice] = "カテゴリが追加されました"
    else 
       @categories = Category.all
       flash[:notice] = "カテゴリ名を入力してください"
       render 'index'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "正常に編集されました"
    else
      render 'edit'
    end
  end
  
  def destroy 
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
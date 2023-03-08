class Api::V1::CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories, status: 200
  end

  def show
    category = Category.find_by(id: params[:id])
    if category
      render json: category, status: 200
    else
      render json: {
        error: "Category not found.."
      }
    end
  end

  def create
    category = Category.new(
      name: category_params[:name]
    )
    if Category.save
      render json: category, status: 200
    else
      render json: {
        error: 'Error creating category...'
      }
    end
  end

  def update
    category = Category.find_by(id: params[:id])
    if category
      category.update(name: params[:name])
       render json: "Category updated successfully"
    else
      render json: {
        error: "Category not found"
      }
    end
  end

  def destroy
    category = Category.find_by(id: params[id])
    if category
      category.destroy
      render json: "Category deleted successfully"
    end
  end

  private
  def category_params
    params.require(:category).permit([:name])
  end
  
end

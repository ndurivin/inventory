class Api::V1::AssetsController < ApplicationController
 
  def index
    assets = Asset.all
    render json: assets, status: 200
  end

  def show
    asset = Asset.find_by(id: params[:id])
    if asset
      render json: asset, status: 200
    else
      render json: {
        error: "Asset not found..!"
      }
    end
  end

  
  def create
    asset = Asset.new(
      name: asset_params[:name, :model, :brand, :image_url, :color, :state]
    )
    if asset.save
      render json: asset, status: 200
    else
      render json: {
        error: 'Error creating Asset...!'
      }
    end
  end

  def update
    asset = Asset.find_by(id: params[:id])
    if asset
      asset.update(name: params[:name])
       render json: "Asset updated successfully!"
    else
      render json: {
        error: "Asset not found"
      }
    end
  end

  def destroy
    asset =Asset.find_by(id: params[id])
    if asset
      Asset.destroy
      render json: "Asset deleted successfully!"
    end
  end

  private
  def asset_params
    params.require(:asset).permit([:name, :model, :brand, :image_url, :color, :state])
  end

end

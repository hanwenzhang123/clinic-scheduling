class Api::V1::ProvidersController < ApplicationController
  def index
    @data = Provider.all
    render json: @data
  end

  def show
    @data = Provider.find(params[:id])
    render json: @data
  end
end

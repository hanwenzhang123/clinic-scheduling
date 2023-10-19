class Api::V1::ConsultationsController < ApplicationController
  def index
    @data = Consultation.all
    render json: @data
  end

  def show
    @data = Consultation.find(params[:id])
    render json: @data
  end
end

class Api::V1::MembersController < ApplicationController
  def index
    @data = Member.all
    render json: @data
  end

  def show
    @data = Member.find(params[:id])
    render json: @data
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :missing_required_attributes

  private

  def record_not_found
    render json: 'record_not_found', status: 404
  end

  def missing_required_attributes
    render json: 'missing_params', status: 404
  end
end
class Api::V1::ConsultationsController < ApplicationController
  def index
    @data = Consultation.all
    render json: @data
  end

  def show
    @data = Consultation.find(params[:id])
    render json: @data
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to @consultation, notice: 'Consultation was successfully created'
    else
      render status: :unprocessable_entity do |format|
        format.html { render 'errors/422' }
        format.json { render json: { error: 'There was an error while creating the model.' }, status: :unprocessable_entity }
      end
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:member, :provider, :appointment_date, :start_time)
  end
end

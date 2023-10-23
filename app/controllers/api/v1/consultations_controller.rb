class Api::V1::ConsultationsController < ApplicationController
  def new
    @mconsultation = Consultation.new
  end

  def index
    @data = Consultation.all
    render json: @data
  end

  def show
    @data = Consultation.find(params[:id])
    render json: @data
  end

  def create
    @member = Member.find(consultation_params[:member_id])
    @provider = Provider.find(consultation_params[:provider_id])

    @consultation = Consultation.new(
      member: @member,
      provider: @provider,
      appointment_date: consultation_params[:appointment_date],
      start_time: consultation_params[:start_time]
    )
    
    if @consultation.save
      render json: { data: 'Consultation was successfully created' }
    else
      render status: :unprocessable_entity do |format|
        format.html { render 'errors/422' }
        format.json { render json: { error: 'There was an error while creating the model.' }, status: :unprocessable_entity }
      end
    end
  end

  def consultation_cancelled
    @consultation = Consultation.find(params[:id])

    if @consultation.status != 'cancelled'
      @consultation.update(status: 'cancelled')
      render json: { data: 'Consultation was successfully cancelled' }
    else
      render json: { error: 'Consultation is already cancelled' }
    end
  end

  def consultation_completed
    @consultation = Consultation.find(params[:id])

    if @consultation.status != 'completed'
      @consultation.update(status: 'completed')
      render json: { data: 'Consultation was successfully completed' }
    else
      render json: { error: 'Consultation is already completed' }
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    if @consultation.destroy
      render json: { message: 'Consultation was successfully deleted.' }
    else
      render json: { error: 'Failed to delete the consultation.' }
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:member_id, :provider_id, :appointment_date, :start_time)
  end
end

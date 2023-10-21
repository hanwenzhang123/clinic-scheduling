class AvailabilityProvider
  APPOINTMENT_DURATION = 1.hour.freeze

  attr_reader :provider_id, :start_time, :end_time, :appointment_duration

  def initialize(params)
    @provider_id = params[:provider_id]
    @start_time = params[:start_time]
    @end_time = params[:end_time]
  end
end
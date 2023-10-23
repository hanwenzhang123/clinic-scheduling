class Consultation < ApplicationRecord
  before_create :generate_end_time_and_set_status
  after_create :associate_with_member_and_provider

  belongs_to :member
  belongs_to :provider

  enum status: {
    booked: 'booked',
    completed: 'completed',
    canceled: 'cancelled'
  }

  private

  def generate_end_time_and_set_status
    start_time = Time.parse(self.start_time)
    end_time = start_time + 1.hour
    self.end_time = end_time.strftime("%H:%M:%S")
    self.status = 'booked'
  end

  def associate_with_member_and_provider
    @member = Member.find(self.member_id)
    @provider = Provider.find(self.provider_id)

    self.member = @member
    self.provider = @provider

    @member.upcoming_consultation = self
    
    self.save
    @member.save
  end
end

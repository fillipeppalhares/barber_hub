class AppointmentRequest
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :barber_id, :integer
  attribute :service_id, :integer
  attribute :customer_name, :string
  attribute :start_at, :datetime
  attribute :end_at, :datetime

  def save
    Appointment.create!(barber_id: barber_id,
                        service_id: service_id,
                        customer_name: customer_name,
                        start_at: start_at,
                        end_at: end_at,
                        status: true)
  end
end

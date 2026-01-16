class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show cancel]

  def show
  end

  def create
    request = AppointmentRequest.new(appointment_params)

    respond_to do |format|
      appointment = request.save

      if appointment
        format.html { redirect_to appointment, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: appointment }
      else
        format.json { render json: appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
  end

  private

  def set_appointment
    @appointment = Appointment.find(params.expect(:id))
  end

  def appointment_params
    params.expect(appointment_request: [:barber_id, :service_id, :customer_name, :start_at, :end_at])
  end
end

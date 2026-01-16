json.extract! appointment, :id, :barber_id, :service_id, :customer_name, :start_at, :end_at, :status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

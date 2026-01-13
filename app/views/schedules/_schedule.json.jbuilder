json.extract! schedule, :id, :weekday, :start_time, :end_time, :barber_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)

json.extract! appointment, :id, :session, :schedule, :bagblood_id, :donor_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

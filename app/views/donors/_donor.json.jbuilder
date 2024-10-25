json.extract! donor, :id, :name, :email, :phone, :icnum, :bloodtype, :created_at, :updated_at
json.url donor_url(donor, format: :json)

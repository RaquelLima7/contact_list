json.extract! contact, :id, :full_name, :document_number, :email, :birthday, :created_at, :updated_at
json.url contact_url(contact, format: :json)

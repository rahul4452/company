json.extract! employee, :id, :name, :manager_id, :city_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)

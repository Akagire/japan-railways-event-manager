json.extract! release, :id, :company_id, :release_date, :release_title, :page_url, :created_at, :updated_at
json.url release_url(release, format: :json)

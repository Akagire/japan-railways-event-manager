class Release < ApplicationRecord
  belongs_to :Company, foreign_key: 'company_id'

  
end

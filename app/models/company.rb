class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :base_url, presence: true, format: {
    with: %r{\Ahttp(s)?://.*\z},
    message: '正しいURLではありません'
  }
end

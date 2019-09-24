class Label < ApplicationRecord
  has_many :labels, through: :labelings
  has_many :labelings, dependent: :destroy
end

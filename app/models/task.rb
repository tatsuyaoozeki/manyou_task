class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { yet: 0, working: 1, completed: 2}
  enum priority: { high: 0, medium: 1, low: 2}

  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?)',
                                  "%#{params[:name]}%",
                                  "%#{params[:status]}%"
                                  )}

  belongs_to :user, dependent: :destroy

  has_many :labelings, dependent: :destroy, inverse_of: :labels
  has_many :labels, through: :labelings
  accepts_nested_attributes_for :labelings, allow_destroy: true, update_only: true
end

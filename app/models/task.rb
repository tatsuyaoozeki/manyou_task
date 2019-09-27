class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { yet: 0, working: 1, completed: 2}
  enum priority: { high: 0, medium: 1, low: 2}

  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?)',
                                  "%#{params[:name]}%",
                                  "%#{params[:status]}%"
                                  )}

  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
end

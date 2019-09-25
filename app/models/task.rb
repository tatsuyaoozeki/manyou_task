class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { yet: 0, working: 1, completed: 2}
  enum priority: { high: 0, medium: 1, low: 2}
  # enum label_id: { HTML: 0, CSS: 1, Javascript: 2, Ruby: 3, Ruby_on_Rails: 4, PostgreSQL: 5, AWS: 6 }
  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?) AND (label_id::text LIKE ?)',
                                  "%#{params[:name]}%",
                                  "%#{params[:status]}%",
                                  "%#{params[:label_id]}%"
                                  )}

  belongs_to :user, dependent: :destroy

  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings#, source: :label
  # accepts_nested_attributes_for :labels, allow_destroy: true


end

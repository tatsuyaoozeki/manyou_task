class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { '未着手': 0, '作業中': 1, '完了': 2}
  enum priority: { high: 0, medium: 1, low: 2}

  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?) AND (priority::text LIKE ?)',
                                  "%#{params[:name]}%",
                                  "%#{params[:status]}%",
                                  "%#{params[:priority]}%")}
end

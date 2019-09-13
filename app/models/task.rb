class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { '未着手': 0, '作業中': 1, '完了': 2}

  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?)',
                                  "%#{params[:name]}%",
                                  "%#{params[:status]}%")}
end

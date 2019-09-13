class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status: { '未着手': 0, '作業中': 1, '完了': 2}

# where(['content LIKE ?', "%#{search}%"])
  def self.search(search)
    search ? where('status::text LIKE ?', "%#{search}%") : all
  end
end

class Todo < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :task, presence: true, length: {maximum: 100}

  default_scope -> { order(due: :asc)}
end

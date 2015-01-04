class Todo < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :task, presence: true

  default_scope -> { order(due: :desc)}
end

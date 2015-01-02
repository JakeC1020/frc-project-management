class Todo < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(due: :desc)}
end

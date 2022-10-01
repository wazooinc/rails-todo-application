class TodoItem < ApplicationRecord
  belongs_to :account

  scope :by_account, lambda { |account|
    where(:account_id => account.id)
  }

  # validations
  validates_presence_of :title
end

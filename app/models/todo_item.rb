class TodoItem < ApplicationRecord
  belongs_to :account

  scope :by_account, lambda { |account|
    where(:account_id => account.id)
  }
end

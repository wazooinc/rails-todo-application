require 'rails_helper'

# Test suite for the Account model
RSpec.describe Account, type: :model do
  # Relationship test
  it { should have_many(:todo_items)}

end
require 'rails_helper'

# Test suite for the TodoItem model
RSpec.describe TodoItem, type: :model do
  # Relationship test
  it {should belong_to(:account)}

  # validation test
  it { should validate_presence_of(:title) }


end
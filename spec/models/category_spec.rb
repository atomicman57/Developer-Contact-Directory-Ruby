require 'rails_helper'

RSpec.describe Category, type: :model do
  # it { should belong_to(:developer) }
  it { should validate_presence_of(:name) }
end

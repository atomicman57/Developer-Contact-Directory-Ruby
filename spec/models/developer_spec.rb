require 'rails_helper'

RSpec.describe Developer, type: :model do
  it { should belong_to(:category) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:github_username) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:country) }

end

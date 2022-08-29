# frozen_string_literal: true

RSpec.describe Vehicle, type: :model do
  it { should have_many(:recieved_messages) }
end

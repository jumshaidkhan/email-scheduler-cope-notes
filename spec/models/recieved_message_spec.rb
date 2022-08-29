# frozen_string_literal: true

RSpec.describe Reservation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:message) }
end

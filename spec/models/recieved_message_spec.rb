# frozen_string_literal: true

RSpec.describe RecievedMessage, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:message) }
end

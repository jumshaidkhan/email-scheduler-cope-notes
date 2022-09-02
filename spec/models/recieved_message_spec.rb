# frozen_string_literal: true

RSpec.describe RecievedMessage, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:message) }
  it 'validates uniquesnesss of user and message' do
    FactoryBot.create :recieved_message
    should validate_uniqueness_of(:user).scoped_to(:message_id)
  end
end

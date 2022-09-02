# frozen_string_literal: true

RSpec.describe Message, type: :model do
  it { should have_many(:recieved_messages) }

  let(:user) { build :user }
  it 'should send user the available message after sign up' do
    expect(user).to receive(:send_mail) 
    user.run_callbacks(:create)
  end
end

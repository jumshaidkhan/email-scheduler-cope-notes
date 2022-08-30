# frozen_string_literal: true

RSpec.describe Message, type: :model do
  it { should have_many(:recieved_messages) }
end

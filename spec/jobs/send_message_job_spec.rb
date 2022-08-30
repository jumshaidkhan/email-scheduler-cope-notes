require 'rails_helper'

RSpec.describe SendMessageJob, type: :job do
  let(:user) { create :user }
  let(:message) { create :message }
  
  describe "send message" do
    it 'sends the message and enque another message' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SendMessageJob.perform_later(user, message)
      }.to have_enqueued_job(SendMessageJob)
    end
  end

end

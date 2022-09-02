# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  let(:user) { create :user }
  let(:message) { create :message }
  describe 'notify' do
    let(:mail) { MessageMailer.with(user: user, message: message).submission }

    it 'renders the headers' do
      expect(mail.subject).to eq('Reminder')
      expect(mail.to).to eq([user.email])
    end

    it 'renders the body' do
      expect(mail.body).to match(message.content)
    end
  end
end

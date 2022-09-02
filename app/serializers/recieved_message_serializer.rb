class RecievedMessageSerializer
  include FastJsonapi::ObjectSerializer
  attribute :message do |recieved_message|
    {
      sent_at: recieved_message.created_at.strftime('%c'),
      message: recieved_message.message.content,
      message_id: recieved_message.message.id
    }
  end
end

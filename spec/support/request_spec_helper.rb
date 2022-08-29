# frozen_string_literal: true

module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def recieved_message_attributes(user_id, message_id)
    @recieved_message_attributes =
      {
        recieved_message:
          attributes_for(:recieved_message).merge({
                                                    user_id: user_id,
                                                    message_id: message_id
                                                  })
      }
  end
end

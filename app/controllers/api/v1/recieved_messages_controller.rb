module Api
  module V1
    class RecievedMessagesController < ApiController
      private
      def resource_params
        params.require(:recieved_message).permit(
          :user_id, :message_id
        )
      end
    end
  end
end

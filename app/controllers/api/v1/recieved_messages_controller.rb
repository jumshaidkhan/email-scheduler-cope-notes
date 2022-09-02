# frozen_string_literal: true

module Api
  module V1
    class RecievedMessagesController < ApiController
      private

      def resource_params
        params.require(:recieved_message).permit(
          :user_id, :message_id
        )
      end

      def load_collection
        self.current_collection = RecievedMessageSerializer.new(current_user.recieved_messages.page(params[:page]))
      end
    end
  end
end

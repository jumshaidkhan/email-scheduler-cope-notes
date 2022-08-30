# frozen_string_literal: true

class HomePageController < ApplicationController

  def index
    @messages = current_user.recieved_messages 
  end

end

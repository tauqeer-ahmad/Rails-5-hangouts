class HangersController < ApplicationController
  def show
    @messages = Message.all
    @haunts   = Haunt.all
  end
end

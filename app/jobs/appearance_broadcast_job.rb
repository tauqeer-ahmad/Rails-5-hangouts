class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(list)
    ActionCable.server.broadcast 'appearance_channel', appearances: render_appearances(list)
  end

  private

    def render_appearances(appearances)
      ApplicationController.renderer.render(partial: 'haunts/appearances', locals: { appearances: appearances })
    end
end

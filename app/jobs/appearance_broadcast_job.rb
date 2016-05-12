class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(list, current_haunt)
    ActionCable.server.broadcast 'appearance_channel', online: render_appearances(list, current_haunt), current_haunt: current_haunt.id
  end

  private

    def render_appearances(appearances, haunt)
      ApplicationController.renderer.render(partial: 'haunts/online', locals: { haunt: haunt, appearences_ids: appearances.collect(&:id) })
    end
end

class ApplicationController < ActionController::Base
  before_action :get_rsvp, only: :index

  private

  def get_rsvp
    if cookies[:rsvp_id]
      @rsvp = Rsvp.find(cookies.encrypted[:rsvp_id])
    end
  end
end

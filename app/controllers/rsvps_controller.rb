class RsvpsController < ApplicationController
  before_action :get_rsvp, only: :landing

  def find_rsvp
    rsvp = Rsvp.find_by(access_key: params[:access_key].downcase)
    if rsvp
      cookies.encrypted[:rsvp_id] = rsvp.id
      render partial: 'partials/rsvp_form', locals: { rsvp: rsvp }
    else
      render json: { error: 'Invalid code, please check and try again' }
    end
  end

  def update
    @rsvp = Rsvp.find(params[:id])
    if @rsvp.update(rsvp_params)
      flash[:notice] = 'Thanks, we hope to see you in August!'
      redirect_to root_path
    else
      render 'rsvps/landing' and return
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(
      :dietary,
      :attending,
      :music_suggestions,
      guests_attributes: [
        :id,
        :name,
        :dietary,
        :attending
      ]
    )
  end

  def get_rsvp
    if cookies[:rsvp_id]
      @rsvp = Rsvp.find(cookies.encrypted[:rsvp_id])
    end
  end
end

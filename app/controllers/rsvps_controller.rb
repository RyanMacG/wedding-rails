class RsvpsController < ApplicationController
  def find_rsvp
    rsvp = Rsvp.find_by(access_key: params[:access_key])
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
      redirect_to root_path
    else
      binding.pry
      render 'application/index' and return
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(
      :dietary,
      :attending,
      guests_attributes: [
        :id,
        :name,
        :dietary,
        :attending
      ]
    )
  end
end

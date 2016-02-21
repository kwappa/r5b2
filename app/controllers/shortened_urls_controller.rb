class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: [:show]

  def show
    redirect_to @shortened_url.original_url
  end

  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)

    if @shortened_url.save
      render :show, formats: [:json], handlers: [:jbuilder]
    else
      raise ActionController::BadRequest
    end

  end

  private

  def set_shortened_url
    @shortened_url = ShortenedUrl.find_by(hashed_url: params[:id]) || raise(ActiveRecord::RecordNotFound)
  end

  def shortened_url_params
    params.require(:shortened_url).permit(:hashed_url, :original_url, :clicked_count)
  end
end

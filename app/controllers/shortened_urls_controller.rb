class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: [:show]

  def show
    redirect_to @shortened_url.original_url
  end

  # POST /shortened_urls
  # POST /shortened_urls.json
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)

    respond_to do |format|
      if @shortened_url.save
        format.html { redirect_to @shortened_url, notice: 'Shortened url was successfully created.' }
        format.json { render :show, status: :created, location: @shortened_url }
      else
        format.html { render :new }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
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

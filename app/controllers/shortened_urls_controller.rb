class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: [:show, :edit, :update, :destroy]

  # GET /shortened_urls
  # GET /shortened_urls.json
  def index
    @shortened_urls = ShortenedUrl.all
  end

  # GET /shortened_urls/1
  # GET /shortened_urls/1.json
  def show
    render text: @shortened_url.original_url
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
  end

  # GET /shortened_urls/1/edit
  def edit
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

  # PATCH/PUT /shortened_urls/1
  # PATCH/PUT /shortened_urls/1.json
  def update
    respond_to do |format|
      if @shortened_url.update(shortened_url_params)
        format.html { redirect_to @shortened_url, notice: 'Shortened url was successfully updated.' }
        format.json { render :show, status: :ok, location: @shortened_url }
      else
        format.html { render :edit }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortened_urls/1
  # DELETE /shortened_urls/1.json
  def destroy
    @shortened_url.destroy
    respond_to do |format|
      format.html { redirect_to shortened_urls_url, notice: 'Shortened url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortened_url
      @shortened_url = ShortenedUrl.find_by(hashed_url: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortened_url_params
      params.require(:shortened_url).permit(:hashed_url, :original_url, :clicked_count)
    end
end

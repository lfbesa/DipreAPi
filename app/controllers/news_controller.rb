class NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]
  before_action :authenticate_token


  # GET /news
  def index
    if @is_authenticated
      @news = New.where("created_at >= ?", 60.days.ago).order(publishedAt: :desc)

      render json: @news
    else
      render status: 403, json: {
        message: "No TOKEN auth."
      }.to_json
    end
  end

  # GET /news/1
  def show
    if @is_authenticated
      render json: @news
    else
      render status: 403, json: {
        message: "No TOKEN auth."
      }.to_json
    end
  end

  # POST /news
  def create
    if @is_authenticated
      @news = New.new(news_params)

      if @news.save
        render json: @news, status: :created, location: @news
      else
        render json: @news.errors, status: :unprocessable_entity
      end
    else
      render status: 403, json: {
        message: "No TOKEN auth."
      }.to_json
    end
  end

  # PATCH/PUT /news/1
  def update
    if @is_authenticated
      if @news.update(news_params)
        render json: @news
      else
        render json: @news.errors, status: :unprocessable_entity
      end
    else
      render status: 403, json: {
        message: "No TOKEN auth."
      }.to_json
    end
  end

  # DELETE /news/1
  def destroy
    if @is_authenticated
      @news.destroy
    else
      render status: 403, json: {
        message: "No TOKEN auth."
      }.to_json
    end
  end

  private
    #This is to authenticate that the call is set from an account of the front-end
    def authenticate_token
      @is_authenticated = false
      if request.headers["TOKEN"]
        if request.headers["TOKEN"] == "AppDipre"
          @is_authenticated = true
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = New.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def news_params
      params.require(:news).permit(:title, :description, :publishedAt, :source, :urlToImage, :url)
    end
end

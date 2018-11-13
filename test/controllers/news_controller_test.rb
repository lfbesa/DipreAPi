require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news = news(:one)
  end

  test "should get index" do
    get news_url, as: :json
    assert_response :success
  end

  test "should create news" do
    assert_difference('New.count') do
      post news_url, params: { news: { description: @news.description, publishedAt: @news.publishedAt, source: @news.source, title: @news.title, url: @news.url, urlToImage: @news.urlToImage } }, as: :json
    end

    assert_response 201
  end

  test "should show news" do
    get news_url(@news), as: :json
    assert_response :success
  end

  test "should update news" do
    patch news_url(@news), params: { news: { description: @news.description, publishedAt: @news.publishedAt, source: @news.source, title: @news.title, url: @news.url, urlToImage: @news.urlToImage } }, as: :json
    assert_response 200
  end

  test "should destroy news" do
    assert_difference('New.count', -1) do
      delete news_url(@news), as: :json
    end

    assert_response 204
  end
end

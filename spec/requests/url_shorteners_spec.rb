require 'rails_helper'

RSpec.describe "UrlShorteners", type: :request do
  let (:url) { "https://www.farmdrop.com/" }

  describe "POST /" do
    it "stores and URL" do
      post url_shorteners_path, params: { url: url }
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      expect(parsed_response["short_url"]).to be_present
      expect(parsed_response["url"]).to eq(url)
    end

    it "stores and URL even if params is a raw json" do
      payload = { url: url }.to_json
      post url_shorteners_path, params: payload
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /:id" do
    context "when short url exist" do
      it "redirects to URL" do
        post url_shorteners_path, params: { url: url }
        parsed_response = JSON.parse(response.body)
        short_url = parsed_response["short_url"]
        get url_shortener_path(short_url)
        expect(response).to redirect_to(url)
      end
    end

    context "when short url exist" do
      it "redirects to URL" do
        get url_shortener_path("ABC")
        expect(response).to redirect_to("/")
      end
    end
  end
end

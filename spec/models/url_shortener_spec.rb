require 'rails_helper'

RSpec.describe UrlShortener, type: :model do
  let(:url) { "http://example.com" }

  describe "#store" do
    it "returns the storaged item" do
      expect(subject.store(url)).to be_a(Hash)
    end

    it "add 'http://' to URL" do
      item = subject.store("example.com")

      expect(item[:url]).to start_with("http://")
    end
  end

  describe "#retrieve" do
    it "returns the URL of a short URL" do
      item = subject.store(url)

      expect(subject.retrieve(item[:short_url])).to eq(url)
    end
  end

  describe "#all" do
    it "returns a hash of short URLs and URLs" do
      expect(subject.all).to be_a(Hash)
    end
  end
end

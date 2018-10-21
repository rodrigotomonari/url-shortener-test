require 'rails_helper'

RSpec.describe Storages::MemoryStorage, type: :model do
  let(:key) { "abc" }
  let(:url) { "http://example.com" }

  describe "#store" do
    it "stores URL" do
      expect(subject.store(key, url)).to be_truthy
    end
  end

  describe "#retrieve" do
    it "retrieves KEY" do
      subject.store(key, url)

      expect(subject.retrieve(key)).to eq(url)
    end
  end

  describe "#has?" do
    it "truthy for storaged key" do
      subject.store(key, url)

      expect(subject.has? key).to be_truthy
    end

    it "falsey for other keys" do
      expect(subject.has? "unknown_key").to be_falsey
    end
  end

  describe "#all" do
    it "returns a hash of keys and URLs" do
      subject.store(key, url)

      expect(subject.all).to eq(key => url)
    end
  end
end

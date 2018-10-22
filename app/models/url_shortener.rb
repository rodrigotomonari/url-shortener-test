# This class is responsible for shortening URLs
# This model depends on a storage abstraction. This abstraction
# is responsible for persisting the URLs

class UrlShortener
  CHAR_LIST = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze

  attr_reader :storage

  def initialize(storage: Storages::MemoryStorage.new)
    @storage = storage
  end

  def store(url)
    url = normalize url
    short_url = generate_short_url
    storage.store(short_url, url)

    { short_url: short_url, url: url }
  end

  def retrieve(key)
    key = normalize_key(key)

    return false unless storage.has? key

    storage.retrieve(key)
  end

  def all
    storage.all.map do |k, v|
      { short_url: k, url: v }
    end
  end

  private

  def generate_short_url
    begin
      short_url = '/' + Array.new(6) { CHAR_LIST.sample }.join
    end while storage.has?(short_url)

    short_url
  end

  def normalize(url)
    return url if url =~ %r{^https?://}

    'http://' + url
  end

  def normalize_key(key)
    '/' + key.delete('/')
  end
end

class Storages::MemoryStorage
  @@urls = {}

  def store(key, url)
    @@urls[key] = url
    true
  end

  def retrieve(key)
    @@urls[key]
  end

  def has?(key)
    @@urls.key?(key)
  end

  def all
    @@urls.clone
  end
end

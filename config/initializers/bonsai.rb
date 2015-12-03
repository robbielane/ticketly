ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']

if ENV['BONSAI_URL']
  Searchkick.client = Elasticsearch::Client.new({url: ENV['BONSAI_URL'], logs: true})
end

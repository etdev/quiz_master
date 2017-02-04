module JsonHelper
  def json_data(response)
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include JsonHelper
end

module PreferredUrl
  class Result < Struct.new(:url, :last_requested_url, :strategy, :status_code)
  end
end

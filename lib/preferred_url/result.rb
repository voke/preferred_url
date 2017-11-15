module PreferredUrl
  class Result < Struct.new(:url, :last_requested_url, :strategy)
  end
end

require 'net/http'

class CheckController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def ruby
    uri = URI.parse(ENV['RUBY_CHECK_URL'])
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new("/")
    request.add_field('Content-Type', 'application/json')
    request.body = {
      'user_code' => params[:user_code],
      'class_name' => params[:class_name],
      'cases' => params[:cases]
    }.to_json
    response = http.request(request)
    render text: response.body
  end
end

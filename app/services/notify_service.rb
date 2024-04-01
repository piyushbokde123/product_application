require 'httparty'

class NotifyService < ApplicationService

  attr_reader :name, :action

  def initialize(name, action)
    @name = name
    @action = action
  end

  def call
    THIRD_PARTY_ENDPOINTS.each do |endpoint|
     HTTParty.post(
        endpoint,
        body: {
          message: "#{name} have been #{action}d"
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
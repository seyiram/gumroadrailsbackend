class OpenAiController < ApplicationController
  require 'openai'

  def generate_image
    client = OpenAI::Client.new(api_key: ENV["OPEN_AI_KEY"])
    response = client.images.generate(
      parameters: {
        prompt: params[:prompt],
        size: params[:size] || '1024x1024'
      }
    )
    render json: { url: response.dig("data", 0, "url") }
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end

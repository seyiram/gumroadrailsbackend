class OpenAiController < ApplicationController
  require 'openai'
  require 'net/http'

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

  def serve_image
    image_url = params[:url]

    # Validate the URL

    uri = URI(image_url)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      send_data response.body, type: response.content_type, disposition: 'inline'
    else
      render json: { error: "Failed to load image" }, status: :bad_gateway
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end

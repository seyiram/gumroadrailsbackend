class OpenAiController < ApplicationController
  require 'openai'

  def generate_image
    openai = OpenAI::Client.new(api_key: ENV["OPEN_AI_KEY"] || Rails.application.credentials.open_ai_key)

    response = openai.create_image(
      prompt: params[:prompt],
      n: params[:n] || 1, #Number of images
      size: params[:size] || '1024x1024' #image size
    )

    render json: response.parsed_response
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end

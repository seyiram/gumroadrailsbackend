class OauthCallbacksController < ApplicationController
  def gumroad
    code = params[:code]
  # Make POST request to Gumroad for an access token
    response = HTTParty.post("https://api.gumroad.com/oauth/token", {
    body: {
      client_id: ENV['GUMROAD_APPLICATION_ID'],
      client_secret: ENV['GUMROAD_APPLICATION_SECRET'],
      code: code,
      redirect_uri: 'https://railsgumroadbackend-be80e4e76158.herokuapp.com/callback',
      grant_type: 'authorization_code'
    }
  })

  if response.parsed_response["access_token"]
    access_token = response.parsed_response["access_token"]
    redirect_to dashboard_path, notice: "Gumroad account linked successfully"
  else
    # Handle the case when there is no access token
    error_message = response.parsed_response["error_description"] || "Unknown error"
    # Log the error and inform the user
    redirect_to dashboard_path, alert: "Failed to Link Gumroad Account"
  end
end
end

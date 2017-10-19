module OauthMockModule
  def stub_omniauth
    OmniAuth.config.mock_auth[:twitter] = {
      'credentials' => {
        'token' => ENV["TWITTER_MOCK_USER_TOKEN"],
        'secret' => ENV["TWITTER_MOCK_USER_SECRET"]
      }
    }

  end
end

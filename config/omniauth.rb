Rails.application.config.middleware.use OmniAuth::Builder do
  oauth_provider = MoviEmote::Application.config.oauth_provider

  # key, secret
  provider :twitter, 'ncBOQWqTD3bh9zBzLuAXXeTa3', 'TZGpQojTGfxlSRe5w6z9d2Lf2SoybBagGMWiYwWQfeHnocBIt5', image_size: 'original'
end
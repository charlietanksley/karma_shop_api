OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:stable] = OmniAuth::AuthHash.new({
    provider: 'stable',
    uid: 1,
    info: Hash[email: 'developer@bignerdranch.com',
      full_name: 'Charlie Tanksley'],
    credentials: Hash[token: 'somelongtoken']
  })

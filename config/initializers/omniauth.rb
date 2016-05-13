Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '975180050919-akkv4dv3onc492pth5p122b5onekvc5r.apps.googleusercontent.com', 'VZQAucWXCLK5fTfCt5bkADEz', scope: 'userinfo.profile,youtube', skip_jwt: true
end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'kc-book-catalogue.herokuapp.com', 'all-for-talent.herokuapp.com'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end
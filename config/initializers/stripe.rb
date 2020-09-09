Rails.configuration.stripe = {
  #verify for not print [] nil
  puts Rails.application.credentials.inspect,
  puts Rails.application.credentials[Rails.env.to_sym].inspect,
  puts Rails.application.credentials[Rails.env.to_sym][:stripe].inspect,
  #stripe credentials
  :publishable_key => Rails.application.credentials[Rails.env.to_sym][:stripe][:STRIPE_PUBLIC_KEY],
  :secret_key      => Rails.application.credentials[Rails.env.to_sym][:stripe][:STRIPE_SECRET_KEY]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
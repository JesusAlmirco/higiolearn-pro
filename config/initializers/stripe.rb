Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials[Rails.env.to_sym][:stripe][:STRIPE_PUBLIC_KEY],
  :secret_key      => Rails.application.credentials[Rails.env.to_sym][:stripe][:STRIPE_SECRET_KEY]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
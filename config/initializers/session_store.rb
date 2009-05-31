# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eparts_session',
  :secret      => '5da9fd6513aa46d88f1a97565f7c47de4bae50d612ae18ef95ca75efeadfab7b608045233344b69b1ee11d130f8b91d491b7c2fa7896bf2da3274dfbbad0c464'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

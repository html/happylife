# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hl_session',
  :secret      => 'c59ca8e9652fa89403903e9d9dbf3f4d4ed76a40b5b0ea6be8ac729dcbcebd109a11496d8fff5ee45fea9ecb301d970c96dcf5acb9cd02922182a5a93ee893b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

Suppenfabrik::Application.config.session_store :cookie_store, key: '_suppenfabrik_session', domain: '.heroku.com'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Suppenfabrik::Application.config.session_store :active_record_store

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( seatmaps.css )
Rails.application.config.assets.precompile += %w( tickets.css )
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( rows.css )
Rails.application.config.assets.precompile += %w( seats.css )
Rails.application.config.assets.precompile += %w( pages.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( articles.css )
Rails.application.config.assets.precompile += %w( home.css )

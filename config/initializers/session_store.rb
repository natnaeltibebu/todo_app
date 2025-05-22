Rails.application.config.session_store :cookie_store, 
  key: '_todo_app_session',
  expire_after: 30.days
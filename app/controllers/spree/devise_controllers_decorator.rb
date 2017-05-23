begin
  Spree::UserPasswordsController.include SolidusI18n::ControllerLocaleHelper
  Spree::UserRegistrationsController.include SolidusI18n::ControllerLocaleHelper
  Spree::UserSessionsController.include SolidusI18n::ControllerLocaleHelper
  Spree::Admin::UserSessionsController.include SolidusI18n::ControllerLocaleHelper
rescue NameError
  # App is not using solidus_auth_devise
end

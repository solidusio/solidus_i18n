module SolidusI18n
  # The fact this logic is in a single module also helps to apply a custom
  # locale on the spree/api context since api base controller inherits from
  # MetalController instead of Spree::BaseController
  module ControllerLocaleHelper
    extend ActiveSupport::Concern

    included do
      private

      # Overrides the Spree::Core::ControllerHelpers::Common logic so that only
      # supported locales defined by SolidusI18n::Config.supported_locales can
      # actually be set
      def set_user_language
        # params[:locale] can be added by routing-filter gem
        I18n.locale =
          if params[:locale] && current_store.preferred_available_locales.include?(params[:locale].to_sym)
            params[:locale]
          else
            super
          end
      end
    end
  end
end

# encoding: utf-8

require 'spec_helper'

RSpec.feature 'Frontend translations', :js do
  given(:language) { Spree.t(:this_file_language, scope: 'i18n', locale: 'pt-BR') }
  given(:store) { create(:store) }

  background do
    reset_spree_preferences
    store.update_attributes(preferred_available_locales: %i[en pt-BR it])
  end

  context 'page' do
    context 'switches locale from the dropdown' do
      before do
        visit spree.root_path
        select(language, from: Spree.t(:language, scope: 'i18n'))
      end

      scenario 'selected translation is applied' do
        expect(page).to have_content(/#{Spree.t(:home, locale: 'pt-BR')}/i)
      end

      scenario 'JS cart link is translated' do
        expect(page).to have_content(/#{Spree.t(:cart, locale: 'pt-BR')}/i)
      end
    end
  end

  context 'solidus_auth_devise pages translation' do
    let(:locale) { :it }

    scenario 'the login page is translated' do
      visit spree.login_path(locale: locale)
      expect(page).to have_content(/#{Spree.t(:login_as_existing, locale: locale)}/i)
    end

    scenario 'the signup page is translated' do
      visit spree.signup_path(locale: locale)
      expect(page).to have_content(/#{Spree.t(:new_customer, locale: locale)}/i)
    end

    scenario 'the forgot password page is translated' do
      visit spree.recover_password_path(locale: locale)
      expect(page).to have_content(/#{Spree.t(:forgot_password, locale: locale)}/i)
    end

    scenario 'the change password page is translated' do
      visit spree.edit_password_path(locale: locale, reset_password_token: "123")
      expect(page).to have_content(/#{Spree.t(:change_my_password, locale: locale)}/i)
    end
  end
end

# encoding: utf-8
require 'spec_helper'

RSpec.describe 'Translation' do
  def translation
    I18n.t('activerecord.attributes.spree/address.zipcode')
  end

  context 'when current locale is en' do
    it 'translation is available' do
      I18n.locale = :en
      expect(translation).to eq 'Zip Code'
    end
  end

  # German is chosen as an example of language whose translations are found in a file.
  context 'when current locale is German' do
    it 'translation is available' do
      I18n.locale = :de
      expect(translation).to eq 'PLZ'
    end
  end

  # Spanish of Chile is chosen.
  context 'when current locale is Chilean Spanish' do
    it 'translation is available' do
      I18n.locale = :'es-CL'
      expect(translation).to eq 'Código Postal'
    end
  end

  # Spanish of Mexico is chosen.
  context 'when current locale is Chilean Spanish' do
    it 'translation is available' do
      I18n.locale = :'es-MX'
      expect(translation).to eq 'Código Postal'
    end
  end

  # Spanish of Ecuador is chosen.
  context 'when current locale is Chilean Spanish' do
    it 'translation is available' do
      I18n.locale = :'es-EC'
      expect(translation).to eq 'Código Postal'
    end
  end

  # Spanish of Spain is chosen.
  context 'when current locale is Chilean Spanish' do
    it 'translation is available' do
      I18n.locale = :es
      expect(translation).to eq 'Código Postal'
    end
  end
end

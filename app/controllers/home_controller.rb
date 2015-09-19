class HomeController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @works = Work.where( "lv = ? AND ru = ? AND en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).limit(4).order("order_number ASC")
  end

  def works
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @works = Work.where( "lv = ? AND ru = ? AND en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).order("order_number ASC")
  end

  def services

  end

  def contacts

  end

end

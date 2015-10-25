class HomeController < ApplicationController

  def index
    @works = Work.where(active: true).limit(4).order("order_number DESC")
  end

  def works
    @works = Work.where(active: true).order("order_number DESC")
  end

  def services

  end

  def contacts

  end

  def yandex_direct

  end

end

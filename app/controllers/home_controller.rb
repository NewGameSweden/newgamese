class HomeController < ApplicationController
  def index
    @articles = Article.all
    @sponsors = Sponsor.all
  end
end

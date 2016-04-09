class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    gibbon = Gibbon::Request.new
    recipients = {
      list_id: "7d35e1f26f"
    }

    settings = {
      subject_line: "New Game news - #{@article.title}",
      title: "#{@article.title}",
      from_name: "New Game",
      reply_to: "info@newgame.se"
    }

    body = {
      type: "regular",
      settings: settings,
      recipients: recipients
    }

    begin
      campaign = gibbon.campaigns.create(body: body)
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end

    body = {
      template: {
        id: 116,
        sections: {
          "header": "#{@article.title}",
          "body": "#{@article.text}"
        }
      }
    }

    gibbon.campaigns(campaign["id"]).content.upsert(body: body)

    gibbon.campaigns(campaign["id"]).actions.send.create

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end
end

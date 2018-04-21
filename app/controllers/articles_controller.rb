class ArticlesController < ActionController::Base

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params) # pass in the parameters
        @article.save
        redirect_to articles_show(@article) # show the latest created article
    end

    private
        # list of the params we want
        def article_params
            params.require(:article).permit(:title, :description)
        end

end
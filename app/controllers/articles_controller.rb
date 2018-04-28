class ArticlesController < ApplicationController

    def index
        @article = Article.all
    end


    def new
        @article = Article.new
    end

    def create
        # @article.save
        # redirect_to articles_path(@article) # show the latest created article
        @article = Article.new(article_params) # pass in the parameters
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def show
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    private
        # list of the params we want
        def article_params
            params.require(:article).permit(:title, :description)
        end

end
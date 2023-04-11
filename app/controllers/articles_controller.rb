class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title,:description))
        #render plain: @article.inspect
        @article.save
        redirect_to article_path(@article)
        #redirect_to @article  -----OR
    
    end
    
    
    
end
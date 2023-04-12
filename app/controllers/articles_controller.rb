class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new ##for first time load page to prevent error
        
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title,:description))
        #render plain: @article.inspect
        @article.save
        if @article.save
            flash[:notice] = "This Article is created successfully"
            redirect_to article_path(@article)
            #redirect_to @article  -----OR
        else
            render 'new'
        end
            
        
    
    end
    
    
    
end
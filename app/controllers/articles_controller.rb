class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @articles = Article.all
    end
    
    def show
        
    end
    
    def new
        @article = Article.new ##for first time load page to prevent error
        
    end
    
    def create
        @article = Article.new(article_params)
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
    
    def edit
        
    end
    
    def update
        
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        
        @article.destroy
        redirect_to articles_path
    end
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title,:description)
    end
        
end
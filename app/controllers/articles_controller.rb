class ArticlesController < ApplicationController
    
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    

    def index
        @articles = Article.all
    end
    
    def new
        @article = current_user.articles.build
    end
    
    def create
        @article = current_user.articles.build(article_params)
        if @article.save 
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
            
    end
    
    def show
        
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    private 
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def find_article
        @article = Article.find(params[:id])
    end

end

class ArticlesController < ApplicationController
    
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    
    def new
        if current_user 
            @article = current_user.articles.build
        else
            @articles = Article.all
            redirect_to articles_path
            flash[:alert] = "You must be signed in to perform this action"
        end
    end
    
    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to @article, notice: "Article was successfully created"
        else 
            render 'new', notice: "Article was not created"
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
        
    def find_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end

end

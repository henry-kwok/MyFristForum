class ArticlesController < ApplicationController
authorize_resource

# create new post
	def new
	end

# help input new post into database
	def create
		@article = Article.new(article_params)
 
 		@article.save
  		redirect_to @article
		#render plain: params[:article].inspect
  	end

# show the detail of the post
	def show
  		@article = Article.find(params[:id])
	end

# show all post
	def index
  		@articles = Article.all
	end

# edit a post
	def edit
  		@article = Article.find(params[:id])
	end

# update post data in the database
	def update
  		@article = Article.find(params[:id])

 		@article.update(article_params)
    		redirect_to @article
  	end

#delete post
	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 
  		redirect_to articles_path
	end

private
  	def article_params
    		params.require(:article).permit(:title, :writer, :text)
  	end
end

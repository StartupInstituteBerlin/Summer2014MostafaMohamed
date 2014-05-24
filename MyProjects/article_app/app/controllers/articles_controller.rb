class ArticlesController < ApplicationController
	def index    # always defualt action
	    @articles = Article.all
	end
	def show     # would show the details of a specific item
		@article = Article.find(params[:id])
	end
	def new      # creates a FORM and data is passed forward to below (create)
		@article = Article.new   # will return an instance of an article 
	end

	def articles_params
    	params.require(:article).permit(:title, :body)
	end
	def create   # creates a record with data and normally redirects to index
		@article = Article.new(articles_params)

		if @article.save
		  redirect_to articles_path, :notice => "Your new article was created!"
		else
		  render "new"
		end
	end
	def edit    # takes a param of what spesific record I want to edit then populates a form and display it to user
		@article = Article.find(params[:id])
	end
	def update  # Info is passed from edit just like (new), it seeks the record in database and updates it then redirects 
		@article = Article.find(params[:id])

		if @article.update_attributes(articles_params)
		  redirect_to articles_path, :notice => "Your new article was updated!"
		else
          render "edit"
		end
	end
	def destroy # pass it if for an object it will destroy it and redirects
       @article = Article.find(params[:id])
       @article.destroy
       redirect_to articles_path, :notice => "Your new article was deleted!"

	end
end

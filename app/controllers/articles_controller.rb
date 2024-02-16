class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end


  def create
    # @article = Article.new(title:"#{params[:article][:title]}", description:"#{params[:article][:body]}")
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article

    """
    When we visit http://localhost:3000/articles/new, the GET /articles/new request is mapped to the new action. The new action does not attempt to save @article. Therefore, validations are not checked, and there will be no error messages.


    When we submit the form, the POST /articles request is mapped to the create action. The create action does attempt to save @article. Therefore, validations are checked. If any validation fails, @article will not be saved, and app/views/articles/new.html.erb will be rendered with error messages.
    """
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article=Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end



  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # can also choose to redirect to articles_path
    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      # u require articles
      params.require(:article).permit(:title, :body, :status)
    end
end

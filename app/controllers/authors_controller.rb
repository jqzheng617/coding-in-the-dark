class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
  end

  def create
    @author = Author.create(author_params)
    if @author.valid?
      redirect_to author_path(@author)
    else
      flash.now[:error] = @author.errors.full_messages
      render :new
      #renders to the same page if left blank
    end
  end

  def show
    set_author
  end

  def edit
    set_author
  end

  def update
    set_author
    @author.update(author_params)
    if @author.valid?
      redirect_to author_path(@author)
    else
      flash.now[:error] = @author.errors.full_messages
      render :edit
      #go back to the edit form if input is invalid
    end
  end

  def destroy
    set_author
    @author.delete
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :birth_year)
  end

  def set_author
    @author = Author.find(params[:id])
  end

end

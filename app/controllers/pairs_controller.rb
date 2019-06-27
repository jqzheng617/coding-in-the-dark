class PairsController < ApplicationController

  def destroy
    @pair = Pair.find(params[:id])
    @pair.delete
    redirect_to books_path
  end

  def create
    @pair = Pair.create(pair_params)
    redirect_to book_path(@pair.book_id)
  end


  private

  def pair_params
    params.require(:pair).permit(:author_id, :book_id)
  end
end

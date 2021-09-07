class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end    

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @bookmark
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else 
      render 'lists/show'
    end 
  end    

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # redirect_to bookmarks_path ancora non creato
  end    

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end  
end

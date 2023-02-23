class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save

    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path
  end

  def delete
  end

  private

  def bookmark_params
    params.require(:review).permit(:content)
  end
end

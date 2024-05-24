class BookmarkController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    redirect_to bookmark_path(@bookmark)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@list)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  def set_list
    @list = List.find(params[:list_id])
  end

end

class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end


  def show
  end


  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end


  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @list = @bookmark.list
      @bookmark.destroy
      redirect_to list_path(@list), status: :see_other
    end

    private

  def set_bookmark
    @bookmark = Bookmark.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

    def bookmark_params
      params.require(:bookmark).permit(:comment, :list_id, :movie_id)
    end
end

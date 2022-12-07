class FavoritesController < ApplicationController
  def create
    binding.pry
    # paramsとはRailsで送られてきた値を受け取るためのメソッド、params[:カラム名]で受け取り
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save

    # 非同期化、リダイレクト、レンダーを削除、viewの中のJSファイルを探しに行く
    # request.refererで直前のページに戻る
    # redirect_to request.referer
    # if request.referer&.include?("/books/#{book.id}")
    #   redirect_to book_path(book.id)
    # else
    #   redirect_to books_path
    # end
  end



  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # redirect_to request.referer
    # if request.referer&.include?("/books/#{book.id}")
    #   redirect_to book_path(book.id)
    # else
    #   redirect_to books_path
    # end
  end

#   private
#   def book_favorite_params
#     params.require(:favorite).permit(:favorite)
#   end
end

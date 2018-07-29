class BooksController < ApplicationController
  layout 'catalog'

  before_action :authenticate_user!, except: :index

  def index
    locals books: Book.order(:name)
  end

  def show
    @book = Book.find(params[:id])
    @order_item = current_order.order_items.new
    render layout: 'application'
  end
end

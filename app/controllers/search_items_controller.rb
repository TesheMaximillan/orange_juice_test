class SearchItemsController < ApplicationController
  include CurrentUserConcern

  def new
    @search_item = SearchItem.new
  end

  def index
    @search_items = SearchItem.all.where(user: @current_user).order(rank: :desc)
    @search_items.map do |search_item|
      search_item.attributes.except('user_id', 'created_at', 'updated_at')
    end
  end

  def create
    if search_item_exists?
      @search_item = SearchItem.all.where(user: @current_user).where(text: search_item_params[:text]).first
      @search_item.update(rank: @search_item.rank + 1)
    else
      @search_item = SearchItem.new(search_item_params)
      @search_item.user_id = @current_user.id
      @search_item.save
    end
    render json: @search_item, status: :created
  end

  private

  def search_item_params
    params.permit(:text)
  end

  # check if the search item already exists
  def search_item_exists?
    SearchItem.all.where(user: @current_user).where(text: search_item_params[:text]).exists?
  end
end

class SearchItemController < ApplicationController
  include CurrentUserConcern
  def index
    @search_items = SearchItem.all.where(user: @current_user).order(rank: :desc)
    @search_items.map { |search_item|
                   search_item.attributes.except('user_id', 'created_at', 'updated_at')
                 }
  end

  def create
  end

  private

  def search_item_params
    params.permit(:text, :rank)
  end
end

class SearchItemsController < ApplicationController
  include CurrentUserConcern

  def new
    @search_item = SearchItem.new
  end

  def create
    if params[:text].present? && params[:text].end_with?('?')
      if search_item_exists?
        @search_item = SearchItem.all.where(user: @current_user)
          .where(text: search_item_params[:text].strip.capitalize).first
        @search_item.update(rank: @search_item.rank + 1)
      else
        @search_item = SearchItem.new(search_item_params)
        @search_item.user_id = @current_user.id
        @search_item.save
      end
    else
      auto_search
    end
  end

  def search_item_params
    params.permit(:text)
  end

  # check if the search item already exists
  def search_item_exists?
    SearchItem.all.where(user: @current_user).where(text: search_item_params[:text].strip.capitalize).exists?
  end

  def auto_search
    if params[:text].present?
      text = params[:text].strip.capitalize
      @search_items = SearchItem.all.where(user: @current_user).where('text LIKE ?', "%#{text}%").order(rank: :desc)
    else
      @search_items = []
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results', partial: 'search_items/search_results',
                                                                   locals: { search_items: @search_items })
      end
    end
  end
end

class TimelineItemsController < ApplicationController
  def index
    @user = $harvest.users.find(params[:user_id])
    @timeline_items = @user.timeline_items.last(10).reverse
  end
end

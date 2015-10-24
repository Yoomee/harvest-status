class TimersController < ApplicationController
  def index
    @timers = Timer.active
    @users = $harvest.users.all.select {|u| u.is_active}
  end

  def users
    @users = $harvest.users.all.select {|u| u.is_active}
    render partial: "timers/users"
  end
end

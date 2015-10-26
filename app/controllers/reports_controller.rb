class ReportsController < ApplicationController
  def week
    @users = {}
    $harvest.users.all.each do |u|
      @users[u.first_name.downcase.to_sym] = u.timeline_items.for_week(report_params[:week]).for_year(report_params[:year]).group_by_day(:created_at).sum("hours")
    end
  end

  def month
    @users = {}
    $harvest.users.all.each do |u|
      @users[u.first_name.downcase.to_sym] = u.timeline_items.for_month(report_params[:month]).for_year(report_params[:year]).group_by_week(:created_at).sum("hours")
    end
  end

  private
  def report_params
    params.permit(:year, :month, :week)
  end
end

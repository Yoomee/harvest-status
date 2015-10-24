class TimesController < ActionController::Base
  def give_time
    @time = Time.now.utc.to_formatted_s(:long_ordinal)
    render :text => @time
  end
end

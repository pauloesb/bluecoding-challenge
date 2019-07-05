module ApplicationHelper
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert, "Attention"
    end
  end

  def alert_generator msg, title
    js add_gritter(msg, title: title, sticky: false)
  end
end

module ApplicationHelper
  def status_text(status)
    case status
    when 0
      "未支付"
    when 1
      "已支付"
    when 2
      "已发货"
    when 3
      "已完成"
    end
  end

  def status_class(status)
    case status
    when 0
      "status-unpaid"
    when 1
      "status-paid"
    when 2
      "status-shipped"
    when 3
      "status-received"
    else
      ""
    end
  end
end

module DeviseHelper
  def bootstrap_alert(key)
    case key
    when "alert"
      "warning"
    when "notice"
      "success"
    when "error"
      "danger"
    end
  end

  def devise_error_messages
    return "" if resource.errors.empty?

    html = ""
    resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
          <span aria-hidden="true">&times;</span>
          <span class="sr-only">close</span>
        </button>
        #{errmsg}
      </div>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end
end

module ApplicationHelper
    def display_notice
        if notice.present
        content_tag(:p, notice, class: "notice")  if notice.present?
    end
    def display_alert
        content_tag(:p, alert, class: "alert") if alert.present?
    end 

    def display_navbar_options
        <% if user_signed_in? %>
            render 'dropdown_options'
    else
        render 'login_buttons'
    end
    end

    def display

end
   


module ApplicationHelper
	def flash_class_for flash_type
		{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages(options = {})
		flash.each do |msg_type, message|
			concat(content_tag(:div, message, class: "alert #{flash_class_for(msg_type)} alert-dismissable") do
				concat content_tag(:button, '<i class="fa fa-times-circle fa-fw"></i>'.html_safe, type: "button", class: "close", data: { dismiss: 'alert' })
				concat message
			end )
		end
		nil
	end
end

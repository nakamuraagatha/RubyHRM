module ApplicationHelper
	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "add_fields btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def flash_class_for flash_type
		{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages(options = {})
		flash.each do |msg_type, message|
			concat(content_tag(:div, message, class: "alert #{flash_class_for(msg_type)} alert-dismissable") do
				concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert'})
				concat message
			end )
		end
		nil
	end
end

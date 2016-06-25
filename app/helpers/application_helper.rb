module ApplicationHelper
	def nav_link(link_text, link_path)
		class_name = current_page?(link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
    		link_to link_text, link_path
		end
	end

	def markdown(content)
		GitHub::Markdown.render_gfm(content).html_safe
	end

	def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
end

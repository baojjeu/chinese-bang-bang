module ApplicationHelper
  def topic_content_for(content, class_name)
    content.gsub(/`([^`]*)`/, '<span class='+ class_name +'>\1</span>').html_safe
  end
end

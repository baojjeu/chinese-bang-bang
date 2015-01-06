module ApplicationHelper
  def customized_content_for(content, class_name)
    content.gsub(/`([^`]*)`/, '<span class='+ class_name +'>\1</span>').html_safe
  end

  def split_topic(name)
    name.scan(/[^。，\x00-\x7F]+/).join.split('')
  end
end

module ApplicationHelper
  def topic_content_for(content, class_name)
    content.gsub(/`([^`]*)`/, '<span class='+ class_name +'>\1</span>').html_safe
  end

  def pinyin_on_the_top_for(name)
    name.scan(/[^。，\x00-\x7F]+/).join.split('')
  end
end

module ApplicationHelper
  def customized_content_for(content)
    content.gsub(/`([^`]*)`/, '<code>\1</code>').html_safe
  end

  def generate_pinyin_ignore_sym_for(name)
    name.scan(/[^。，\x00-\x7F]+/).join.split('')
  end
end

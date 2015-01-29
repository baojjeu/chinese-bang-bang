module ApplicationHelper
  def customized_content_for(content)
    content.gsub(/`([^`]*)`/, '<code>\1</code>').html_safe
  end

  def generate_pinyin_ignore_sym_for(name)
    name.scan(/[^。，\x00-\x7F]+/).join.split('')
  end

  def thumb_for(user)
    if user.profile.avatar.present?
      user.profile.avatar.thumb.url
    else
      "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?s=48"
    end
  end
end

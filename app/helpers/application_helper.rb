module ApplicationHelper
  def settings
    SiteSettings
  end

  def phone(number, css_class="orange")
    number.gsub!(" ", "")
    html = "#{number[0]} <span class=\"#{css_class}\">#{number.slice(1..3)}</span> #{number.slice(4..-1)}"
    html.html_safe
  end

  def content(key, mode = :string)
    if mode == :text
      simple_format SiteSettings[key]
    else
      SiteSettings[key]
    end
  end

  alias :c :content
end

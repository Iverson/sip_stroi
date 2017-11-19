module ApplicationHelper
  def settings
    SiteSettings
  end

  def phone(number, css_class="orange")
    number.gsub!(" ", "")
    html = "<span class=\"country\">#{number[0]}</span> <span class=\"city #{css_class}\">#{number.slice(1..3)}</span> #{number.slice(4..-1)}"
    html.html_safe
  end

  def content(key, mode = :string)
    if mode == :text
      simple_format SiteSettings[key]
    else
      (SiteSettings[key] || '').html_safe
    end
  end

  def discount(value)
    number_with_delimiter(value.round(0))
  end

  alias :c :content
end

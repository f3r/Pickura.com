module ApplicationHelper
  def page_title
    title = "Facebook Covers | Pickura.com"
    if @title
      title = "#{@title} #{title}"
    end
    title
  end
end

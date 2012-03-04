# Helpers for generating javascript code for views
module JavascriptHelper

  def page_replace(selector, *render_attr)
    %{
      $("#{selector}").replaceWith("#{escape_javascript(render *render_attr) }");
    }.html_safe
  end

  def page_replace_html(selector, *render_attr)
    %{
      $("#{selector}").html("#{escape_javascript(render *render_attr) }");
    }.html_safe
  end

  def ajax_request(url)
    %{
      setTimeout(function(){
        $.ajax({
          url: '#{url}'
        });
      }, 100);
    }.html_safe
  end
end


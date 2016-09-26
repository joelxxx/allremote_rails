module ApplicationHelper
  def csv_upload link
    html = "<p>Import from CSV file</p>\n".html_safe
    html << form_tag( link, multipart: true )
      html << '  <input type="file" name="file" id="file" />'.html_safe
      html << '  <input type="submit" name="commit" value="Import" />'.html_safe
    html << "</form><br/>".html_safe
  end

end

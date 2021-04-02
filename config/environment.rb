# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
  unless html_tag =~ /^<label/
    "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  else
    html_tag.html_safe
  end
end

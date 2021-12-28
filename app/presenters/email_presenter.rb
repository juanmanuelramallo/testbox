class EmailPresenter < ApplicationPresenter
  alias email object

  def html_body
    html_parts.first
  end

  def text_body
    text_parts.first
  end

  def html_parts
    email.mail.parts.select { |part| part.content_type.match? "text/html" }
  end

  def text_parts
    email.mail.parts.select { |part| part.content_type.match? "text/plain" }
  end
end

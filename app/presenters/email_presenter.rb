class EmailPresenter < ApplicationPresenter
  alias_method :email, :object

  def from
    mail.from.join(", ")
  end

  def to
    mail.to.join(", ")
  end

  def cc
    return "" if mail.cc.blank?

    mail.cc.join(", ")
  end

  def bcc
    return "" if mail.bcc.blank?

    mail.bcc.join(", ")
  end

  def html_body
    html_parts(multiparted_part.presence ? multiparted_part.parts : mail.parts).first.decoded
  end

  def text_body
    text_parts(multiparted_part.presence ? multiparted_part.parts : mail.parts).first.decoded
  end

  def multiparted_part
    mail.parts.detect { |part| part.multipart? }
  end

  private

  def html_parts(parts)
    parts.select { |part| part.content_type.match? "text/html" }
  end

  def text_parts(parts)
    parts.select { |part| part.content_type.match? "text/plain" }
  end
end

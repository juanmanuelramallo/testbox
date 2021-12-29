class AttachmentsController < ApplicationController
  def show
    email = ActionMailbox::InboundEmail.find(params[:id])
    attachment = email.mail.attachments.find { |attachment| attachment.filename == attachment_params }

    Tempfile.open([attachment.filename, ""], binmode: true) do |file|
      file.puts attachment.decoded
      file.rewind

      send_file file.path, type: attachment.content_type, disposition: "inline"
    end
  end

  private

  def attachment_params
    params.require(:filename)
  end
end

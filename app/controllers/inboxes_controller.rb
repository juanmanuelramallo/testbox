class InboxesController < ApplicationController
  def index
    @inboxes = Inbox.all.order(created_at: :desc)
    @new_inbox = Inbox.new
  end

  def new
    @new_inbox = Inbox.new
  end

  def create
    @new_inbox = Inbox.new(inbox_params)

    respond_to do |format|
      if @new_inbox.save
        format.html { redirect_to inbox_inbound_emails_path(@new_inbox), notice: "Good" }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_inbox",
            partial: "inboxes/form",
            locals: {new_inbox: @new_inbox}
          )
        end
      end
    end
  end

  def destroy
    inbox = Inbox.find(params[:id])
    inbox.destroy!
    respond_to do |format|
      format.turbo_stream { redirect_to root_path }
      format.html { redirect_to root_path, notice: "Inbox removed successfully" }
    end
  end

  private

  def inbox_params
    params.require(:inbox).permit(:name)
  end
end

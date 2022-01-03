class InboxesController < ApplicationController
  def index
    @inboxes = current_account.inboxes.order(created_at: :desc)
    @new_inbox = Inbox.new
  end

  def new
    @new_inbox = Inbox.new
  end

  def create
    @new_inbox = current_account.inboxes.new(inbox_params)

    if current_account.inboxes.count > 0
      @new_inbox.errors.add(:base, "Please upgrade your account. Max number of inboxes reached.")
      respond_to do |format|
        format.html { redirect_to current_account, alert: "Please upgrade your account." }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_inbox",
            partial: "inboxes/form",
            locals: {new_inbox: @new_inbox}
          )
        end
      end
      return
    end

    respond_to do |format|
      if @new_inbox.save
        format.html { redirect_to account_inbox_inbound_emails_path(current_account, @new_inbox), notice: "Inbox created successfully." }
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
    inbox = current_account.inboxes.find(params[:id])
    inbox.destroy!
    respond_to do |format|
      format.turbo_stream { redirect_to root_path }
      format.html { redirect_to root_path, notice: "Inbox removed successfully." }
    end
  end

  private

  def inbox_params
    params.require(:inbox).permit(:name)
  end
end

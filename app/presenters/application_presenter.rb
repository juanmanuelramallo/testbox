class ApplicationPresenter
  delegate_missing_to :object

  attr_reader :object

  def initialize(object)
    @object = object
  end
end

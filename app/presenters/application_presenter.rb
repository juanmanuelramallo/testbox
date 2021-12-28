class ApplicationPresenter
  delegate_missing_to :object

  attr_reader :object

  class << self
    def wrap(collection)
      collection.map { |object| new(object) }
    end
  end

  def initialize(object)
    @object = object
  end
end

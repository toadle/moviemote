class TvShowSearch
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :query

  def persisted?
    false
  end

end
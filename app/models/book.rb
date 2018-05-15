class Book < ApplicationRecord
  belongs_to :author

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end

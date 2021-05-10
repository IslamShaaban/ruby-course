class Comment < ApplicationRecord
  include ActiveModel::SerializerSupport
  belongs_to :article
  belongs_to :user
end

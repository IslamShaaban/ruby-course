class ArticleSerializer < ActiveModel::Serializer
  has_one :user
  attributes :title, :text, :comments
end

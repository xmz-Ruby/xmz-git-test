class AddArticleImgToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :article_img, :string
  end
end

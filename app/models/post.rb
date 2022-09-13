class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :post_tags, through: :post_tag_relations


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.post_tag_relations.pluck(:post_tag_names) unless self.post_tag_relations.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグのリレーションを消す
    old_tags.each do |old|
      self.post_tag_relations.delete　PostTag.find_by(name: old)
    end

    # 新しいタグを検索、なければ作る。新しいタグのリレーションを作成。
    new_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(name: new)
      PostTagRelation.create(post_id:self.id,post_tag_id:new_post_tag.id)
    end
  end

end

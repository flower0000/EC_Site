class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  #refile用のリレーション
  has_many :item_images, dependent: :destroy
  accepts_attachments_for :item_images, attachment: :image
  #accepts_attachments_for :article_images, attachment: :image, append: true
  #オプション
  #update編集アクションの際、ファイルの上書き（消す）または元のファイルを保持して追加（消さない）を切り替える
  #ファイルを上書きする・・・デフォルト設定、オプションを書かない
  #元のファイルを保持し追加アップロードする・・・append: true

end

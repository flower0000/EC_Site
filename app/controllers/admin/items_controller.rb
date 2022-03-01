class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  #Itemモデルから登録した商品を探す
    if @item.item_images.present?
      @item_images = @item.item_images
    end
  #登録したItemモデルにアソシエーションしているitem_imagesモデルのデータを全て取得．ただしあれば。なければスルー。
  end

  def index

  end

  def edit
    @item = Item.find(params[:id])
    #製品データ取得
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, item_images_images: [])
  end
#複数画像を保存する際のストロングパラメータへの記述の仕方
#(子のテーブル名)_(image_id + s): []。もちろんrefileなのでidは省略
#配列の各要素に格納されたファイルがひとつずつ、子のテーブルのimage_idカラムに保存されていく
#したがってfindメソッドで1つずつ取り出すこともできる(1レコードに1つのimage_idが保存されていく感じ)

#なお、子のテーブルにはitem_idというカラムがありますが、テーブル同士のリレーション関係があるため、
#ファイル保存の際にレコードが生成されると自動で親のレコードのidが入力さる。したがって改めて値を入れて保存する必要が無い。

end

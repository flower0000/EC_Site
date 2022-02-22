class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    @Item.save
    redirect_to root_path#仮のリダイレクト先。後で編集
  end

  def show

  end

  def index

  end

  def edit

  end

  def update

  end

private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, item_images_images: [])
  end
#複数画像を保存する際のストロングパラメータへの記述の仕方
#(子のテーブル名)_(image_id + s): []。もちろんrefileなのでidは省略
#配列の各要素に格納されたファイルがひとつずつ、子のテーブルのimage_idカラムに保存されていく
#したがってfindメソッドで1つずつ取り出すこともできる(1レコ＾ドに1つのimage_idが保存されていく感じ)

#なお、子のテーブルにはitem_idというカラムがありますが、テーブル同士のリレーション関係があるため、
#ファイル保存の際にレコードが生成されると自動で親のレコードのidが入力さる。したがって改めて値を入れて保存する必要が無い。

end

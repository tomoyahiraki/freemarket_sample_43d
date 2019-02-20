crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :users
end

crumb :edit do
  link "本人確認の登録", edit_user_path
  parent :users
end

crumb :show_creditcard do
  link "支払方法", user_path
  parent :users
end

crumb :post_creditcard do
  link "クレジットカード情報入力", purchase_users_path
  parent :users
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :users
end

crumb :lists do
  link "出品した商品", lists_users_path
  parent :users
end

crumb :userproduct do
  link "出品商品画面", "/userproduct/:product_id/show"
  parent :lists
end

crumb :product do |product|
  link product.title, product_path(product)
end

crumb :category do |category_name|
  link category_name.name, "/products/:id/category"
end

crumb :category_index do
  link "カテゴリー一覧", category_index_products_path
end

crumb :search do
  link "#{params[:keyword]}", search_products_path
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

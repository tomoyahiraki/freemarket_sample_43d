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

crumb :update do
  link "プロフィール", user_path
  parent :users
end

crumb :product do |product|
  link product.title, product_path(product)
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

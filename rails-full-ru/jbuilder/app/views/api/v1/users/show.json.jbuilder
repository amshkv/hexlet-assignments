# frozen_string_literal: true

json.extract! @user, :id, :email

json.full_name "#{@user[:first_name]} #{@user[:last_name]}"

json.posts do
  json.partial! 'posts', collection: @user.posts, as: :post
end

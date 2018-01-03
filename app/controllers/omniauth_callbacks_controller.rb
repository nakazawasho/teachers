class OmniauthCallbacksController < ApplicationController
  def facebook
  # raise request.env['omniauth.auth'].to_yaml #ここで取得できるデータを確認できます。
  callback_from("facebook")
 end

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_omiauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:notice] = "ログインできません"
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to mypage_index_path
    end
  end
end

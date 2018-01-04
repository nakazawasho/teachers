class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  # raise request.env['omniauth.auth'].to_yaml #ここで取得できるデータを確認できます。
  callback_from("facebook")
 end

  def callback_from(provider)
    provider = provider.to_s

    @teacher = Teacher.from_omniauth(request.env['omniauth.auth'])
    binding.pry

    if @teacher.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @teacher, event: :authentication
    else
      flash[:notice] = "ログインできません"
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to  new_teacher_registration_path
    end
  end
end

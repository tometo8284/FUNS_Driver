class ApplicationController < ActionController::Base
  
  private
  # 管理者とユーザーのログイン後の遷移先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

  # 管理者とユーザーのログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
  
end

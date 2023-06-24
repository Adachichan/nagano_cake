class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource

    # admin
    when Admin
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource

    # admin(↓error発生)
    when Admin
      new_admin_session_path
    end
  end

end

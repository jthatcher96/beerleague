module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id] != nil
  end

  def check_logged_in
    redirect_to root unless logged_in?
  end

  def admin?
    if logged_in?
      current_user.league_admin
    end
  end

  def check_admin
    redirect_to root_path unless admin?
  end

  def team_manager?(team)
    if logged_in?
      team.manager_id == current_user.id
    end
  end

end

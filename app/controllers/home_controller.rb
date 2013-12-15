class HomeController < ApplicationController
  def index
  end

  def pattern_maker
          if !current_user then
                  redirect_to "/users/sign_in"
          else
                  @skirtpattern = current_user.build_skirtpattern
          end
  end

end
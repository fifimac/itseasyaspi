class HomeController < ApplicationController
  def index
  end

  def pattern_maker
          if !current_user then
                  redirect_to "/"
          else
                  @skirtpattern = current_user.build_skirtpattern
          end
  end

end
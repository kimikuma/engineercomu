class SearchsController < ApplicationController

  def search
    @word=params[:word]
    @conditions=params[:conditions]

    @users=User.search_for(@word,@conditions)

  end

end

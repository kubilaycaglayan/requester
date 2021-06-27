require 'httparty'

class RequesterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get
    if !is_authorized
      render status: 400
    else
      path = requester_params[:path]
      path = insert_forward_slash path

      response = HTTParty.get(path)

      if (response.code == 200)
        render json: response
      else
        render plain: "Error in request", status: response.code
      end
    end
  end

  private

  def requester_params
    params
  end

  def is_authorized
    return true

    # FOR OPTIONAL AUTH
    if params['key'] == "0101"
      return true
    else
      return false
    end
  end

  def insert_forward_slash path
    index_of_fs = path.index(/\//)

    path.insert(index_of_fs, "/")
  end
end
require 'httparty'
require 'json'

class RequesterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get
    if !is_authorized
      render status: 400
    else
      path = insert_forward_slash request.fullpath.dup
      response = make_a_request path, request

      if response.code == 200
        render json: response.parsed_response
      else
        render plain: 'Error in request', status: response.code
      end
    end
  end

  private

  def make_a_request(path, request)
    if request.method == 'GET'
      HTTParty.send(request.method.downcase, path)
    else
      HTTParty.send(
        request.method.downcase,
        path,
        body: accept_all_params[:requester].to_json,
        headers: { 'Content-Type': 'application/json' }
      )
    end
  end

  def accept_all_params
    params.permit!
  end

  def is_authorized
    return true

    # FOR OPTIONAL AUTH
    if params['key'] == '0101'
      return true
    else
      return false
    end
  end

  def insert_forward_slash path
    index_of_fs = path[1, path.length].index(/\//)

    path[1, path.length].insert(index_of_fs, '/')
  end
end
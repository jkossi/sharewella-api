class MembersController < ApplicationController
  def index
    render json: UserSerializer.new(current_user).serializable_hash, status: :ok
  end
end

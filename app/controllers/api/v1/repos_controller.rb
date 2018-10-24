class Api::V1::ReposController < ApiController
  def index
    @repos = Repo.all
    render json: @repos
  end
end

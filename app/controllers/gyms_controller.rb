class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        if gym
            gym.memberships.destroy_all
            gym.destroy
            head :no_content
        else
            render json: { error: "not found"}, status: :not_found
        end
    end

    private
   
    def render_not_found_response
        render json: { error: "not found" }, status: :not_found
    end

end

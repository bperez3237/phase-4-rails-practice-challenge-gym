class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def create
        membership = Membership.create!(gym_id: params[:gym_id], client_id: params[:client_id], charge: params[:charge])
        render json: membership, status: :created
    end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

end

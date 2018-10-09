class DevelopersController < ApplicationController
    before_action :set_developer, only: [:show, :update, :destroy]

    # GET /developers
    def index
        @developers = Developer.all
        json_response(@developers)
    end

    # POST /developers
    def create
        @developer = Developer.create!(developer_params)
        json_response(@developer, :created)
    end

    # GET /developers/:id
    def show
        json_response(@developer)
    end

    # GET categories/:id/developers
    def getByCategory
        @developer = Developer.where(category_id: params[:id]).order("created_at DESC")
        json_response(@developer)
    end

    # PUT /developers/:id
    def update
        @developer.update(developer_params)
        head :no_content
    end

    # DELETE /developers/:id
    def destroy
        @developer.destroy
        head :no_content
    end

    private

    def developer_params
        # whitelist params
        params.permit(:first_name, :last_name, :email, :github_username, :phone_number, :website, :country, :category_id)
    end

    def set_developer
        @developer = Developer.find(params[:id])
    end
end

class BlogsController < ApplicationController

    before_action :user_signed_in?

    def new
        @blog = Blog.new
        @user = User.pluck(:name, :id)
        render layout: 'admin'
        #render plain: user
    end

    def create
        blog = Blog.new(resource_params).save
        flash[:notice] = "Blog has been created"
        redirect_to blogs_path
    end

    def edit
        @blog = Blog.find params[:id]
        @user = User.pluck(:name, :id)
    end

    def update
        blog = Blog.find(params[:id])
        blog.update(resource_params)
        redirect_to blogs_path        
    end

    def index
        @blogs = Blog.all
    end

    def show
        id = params[:id]
        #render plain: id
        @blog = Blog.find(id)
    end

    def destroy
        blog = Blog.find params[:id]
        blog.destroy
        redirect_to blogs_path
    end

    private

    def resource_params
        params.require(:blog).permit(:title, :user_id, :description)
    end

end
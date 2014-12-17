class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
      @title = 'Tweet'
      @message = Message.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    file1 = params[:post][:image]
    file2 = params[:post][:image2]
    file3 = params[:post][:image3]
    file4 = params[:post][:image4]
    file5 = params[:post][:image5]
    @post.set_image(file1)
    @post.set_image2(file2)
    @post.set_image3(file3)
    @post.set_image4(file4)
    @post.set_image5(file5)
    @place = Place.new({address: params[:post][:address]})
    @place.save
    @post.latitude=@place.latitude
    @post.longitude=@place.longitude
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:youbi_all,:content, :user_id, :image, :image2, :image3, :image4, :image5, :address, :all, :shop_kind, :kitchen, :hall, :counter, :gas_stove, :range, :refrigerator, :dishwashers, :worktop, :time, :time2, :house_rent, :fryer, :sink, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      redirect_to root_url unless current_user?(@post.user)
    end

    def signed_in?
    !current_user.nil?
    end
end

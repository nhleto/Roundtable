class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
    @groups = Group.all.order('created_at DESC')
    @group = Group.new
    @comment = current_user.comments.build
    return unless params[:search]

    unless params[:search][:name].empty?
      begin
        @user = User.where(name: params[:search][:name]) || User.where(username: params[:search][:username])
        redirect_to user_path(@user.ids)
      rescue StandardError
        redirect_to request.referrer
      end
    end
  end

  def like
    @post = Post.find(params[:id])
    @like = @post.likes.build(user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.js { }
        format.html { redirect_to request.referrer }
      else
        format.html { redirect_to request.referrer, alert: "Like Failed to save: #{@like.errors.messages}" }
      end
    end
  end

  def unlike
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user_id: current_user.id)
    respond_to do |format|
      if @like.destroy
        format.js {}
        format.html { redirect_to request.referrer }
      else
        format.html { redirect_to request.referrer, alert: "Like Failed to destroy: #{@like.errors.messages}" }
      end
    end
  end
  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @posts = Post.all.order('created_at DESC')
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, alert: "Post failure #{@post.errors.messages}" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end

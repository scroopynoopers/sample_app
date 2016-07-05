class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :upvote, :downvote]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      respond_to do |format|
        format.html
        format.js do
          stuff = render_to_string(partial: "microposts/micropost.html", locals: {micropost: @micropost})
          render partial: 'micropost', locals: {stuff: stuff}
        end
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    respond_to do |format|
      format.html
      format.js do
        render partial: 'delete', locals: {micropost_id: params[:id]}
      end
    end
  end


  def upvote
    @micropost = Micropost.find(params[:id])
    @micropost.upvote_by current_user
    respond_to do |format|
      format.html
      format.js do
        voting_partial = render_to_string(partial: "microposts/voting.html", locals: {micropost: @micropost})
        render partial: 'upvote_downvote', locals: {partial_to_render: voting_partial, micropost: @micropost}
      end
    end
  end

  def downvote
    @micropost = Micropost.find(params[:id])
    @micropost.downvote_by current_user
    respond_to do |format|
      format.html
      format.js do
        voting_partial = render_to_string(partial: "microposts/voting.html", locals: {micropost: @micropost})
        render partial: 'upvote_downvote', locals: {partial_to_render: voting_partial, micropost: @micropost}
      end
    end
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

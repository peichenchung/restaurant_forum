class FollowshipsController < ApplicationController
  def create #follow
    #產生一個新的Followship物件,並設定兩個外鍵user_id和following_id
    @followship = current_user.followships.build(following_id: params[:following_id])

    if @followship.save #將攜帶資料的Followship物件存入資料庫
      flash[:notice] = "Successfully followed"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
end

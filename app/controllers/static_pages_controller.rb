class StaticPagesController < ApplicationController
  def index
    flickr_service = FlickrService.new
    photos_list =
      if params.include? :user_id
        flickr_service.get_public_photos_by_user_id params[:user_id]
      else
        flickr_service.get_public_photos_by_user_id
      end
    @images = flickr_service.get_image_from_photo_info photos_list
  end

  private

  def static_params
    params.permit(:user_id)
  end
end

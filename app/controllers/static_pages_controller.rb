class StaticPagesController < ApplicationController
  def index
    flickr_service = FlickrService.new
    photos_list =
      if some_user
        cleaned_id = clean_user_id(static_params)
        logger.debug "PHOTOS: #{cleaned_id}"
        flickr_service.get_public_photos_by_user_id cleaned_id
      else
        flickr_service.get_public_photos_by_user_id
      end
    @images = flickr_service.get_image_from_photo_info photos_list unless photos_list == :poor_request
  end

  private

  def clean_user_id(hash)
    user_id = hash[:user_id]
    user_id.scan(/\w+|@/).join
  end

  def some_user
    params[:user_id] && !params[:user_id].empty?
  end

  def static_params
    params.permit(:user_id, :commit)
  end
end

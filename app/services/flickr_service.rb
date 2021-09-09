# Interface between the app and Flickr API
class FlickrService
  attr_reader :flickr_key, :flickr_secret

  @flicker_key = ENV['FLICKR KEY']
  @flicker_secret = ENV['FLICKR SECRET']

  # Return an image by the given user
  def get_public_photos_by_user_id(user_id = '193884967@N03')
    response = HTTP.get "https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&
                          api_key=#{flickr_key}&user_id=#{user_id}&format=json&nojsoncallback=1"
    parsed = JSON.parse(response)
    parsed['photos']['photo']
  end

  # Map each photo to their image url
  def get_image_from_photo_info(photos)
    photos.map do |photo|
      HTTP.get "https://live.staticflickr.com/#{photo['server-id']}/#{photo['id']}_#{photo['secret']}.jpg"
    end
  end
end

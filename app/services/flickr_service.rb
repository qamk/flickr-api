# Interface between the app and Flickr API
class FlickrService
  # Return an image by the given user
  def get_public_photos_by_user_id(user_id = '193884967@N03')
    response = HTTP.get "https://www.flickr.com/services/rest/?", params:
                        { method: 'flickr.people.getPublicPhotos', api_key: ENV['FLICKR_KEY'],
                          user_id: user_id, format: 'json', nojsoncallback: '1' }
    parsed = JSON.parse(response)
    return :poor_request if poor_request?(parsed)

    parsed['photos']['photo']
  end

  # Map each photo to their image url
  def get_image_from_photo_info(photos)
    photos.map do |photo|
      "https://live.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}.jpg"
    end
  end

  private

  def poor_request?(parsed_response)
    parsed_response['stat'] == 'fail'
  end
end

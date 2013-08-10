class FlickrLib
  def get_image_for_keyword(keyword)
    # Flickr API
    # Key: ef723e9bf172d69246ea3f50c3498177
    # Secret: 5364c03a181db7dc 

    require 'flickraw'

    FlickRaw.api_key="ef723e9bf172d69246ea3f50c3498177"
    FlickRaw.shared_secret="5364c03a181db7dc"

    list   = flickr.photos.search text: keyword


    # id     = list[0].id
    # secret = list[0].secret
    # info = flickr.photos.getInfo :photo_id => id, :secret => secret
    # puts list[0].to_json
    FlickRaw.url_c list[0]

  end
end
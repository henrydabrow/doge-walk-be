# frozen_string_literal: true

class PetSerializer < BaseSerializer
  attribute :id, key: :id
  attributes :name,
             :kind,
             :breed,
             :birthdate,
             :description,
             :image

  belongs_to :owner, serializer: UserLightSerializer

  def image
    p "xd"
    binding.irb
    return unless object.image.attached?

    object.image.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(object.image)
  end
end

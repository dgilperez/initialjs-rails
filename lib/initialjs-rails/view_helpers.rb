require 'json'

module InitialjsRails
  module ViewHelpers
    def avatar_image(avatarable, options = {})
      size          = options.fetch(:size)          { 100 }
      klass         = options.fetch(:class)         { '' }
      round_corners = options.fetch(:round_corners) { true }

      data_attributes = { name: avatarable.name,
        height: size,
        width: size,
         "font-size" => (size * 0.6) }

      data_attributes.merge!(radius: (size * 0.13).round) if round_corners

      content_tag :img, nil, class: "initialjs-avatar #{klass}", data: data_attributes
    end
  end
end

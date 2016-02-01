require 'json'

module InitialjsRails
  module ViewHelpers
    def avatar_image(avatarable, options = {})
      size          = options.fetch(:size)          { 100 }
      klass         = options.fetch(:class)         { '' }
      round_corners = options.fetch(:round_corners) { true }
      seed          = options.fetch(:seed)          { 0 }
      char_count    = options.fetch(:count)         { 1 }
      txt_color     = options.fetch(:color)         { '#ffffff' }

      data_attributes = {
        name:         get_name_with_count(avatarable, char_count),
        seed:         seed,
        height:       size,
        width:        size,
        'char-count': char_count,
        'font-size':  (size * 0.6),
        'text-color': txt_color
      }

      data_attributes.merge!(radius: (size * 0.13).round) if round_corners

      content_tag :img, nil, alt: get_name(avatarable), class: "initialjs-avatar #{klass}".strip, data: data_attributes
    end

    def get_name_with_count(avatarable, count)
      name = get_name(avatarable)
      if count == 2
        "#{name.partition(" ").first[0]}#{name.partition(" ").last[0]}"
      else
        name
      end
    end

    def get_name(avatarable)
      avatarable.is_a?(String) ? avatarable : avatarable.name
    end
  end
end

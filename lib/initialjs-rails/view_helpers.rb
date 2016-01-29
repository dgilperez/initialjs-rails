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
        name:         get_name(avatarable, char_count),
        seed:         seed,
        height:       size,
        width:        size,
        'char-count': char_count,
        'font-size':  (size * 0.6),
        'text-color': txt_color
      }

      data_attributes.merge!(radius: (size * 0.13).round) if round_corners

      content_tag :img, nil, alt: avatarable, class: "initialjs-avatar #{klass}".strip, data: data_attributes
    end

    protected

    def get_name(name, count)
      if count == 2
        "#{name.partition(" ").first[0]}#{name.partition(" ").last[0]}"
      else
        name
      end
    end
  end
end

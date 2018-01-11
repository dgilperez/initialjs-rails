require 'spec_helper'

describe InitialjsRails::ViewHelpers, type: :helper do
  describe '#avatar_image' do
    subject { HelperClass.new }

    it 'generates an image tag for a name string' do
      expected_tag = default_avatar_image_result(name: 'Ivan')
      expect(subject.avatar_image('Ivan')).to eq expected_tag
    end

    it 'generates an image tag for a valid user' do
      user = ValidUser.new('Fyodor')
      expected_tag = default_avatar_image_result(name: 'Fyodor')
      expect(subject.avatar_image(user)).to eq expected_tag
    end

    it 'raises ArgumentError for an invalid user' do
      user = InvalidUser.new('Nicolai')
      expect do
        subject.avatar_image(user)
      end.to raise_error ArgumentError
    end

    it 'with a custom square size' do
      expected_tag = "<img alt=\"Alexander\"
                      class=\"initialjs-avatar\"
                      data-name=\"Alexander\"
                      data-seed=\"0\"
                      data-height=\"42\"
                      data-width=\"42\"
                      data-char-count=\"1\"
                      data-font-size=\"25\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"5\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Alexander', size: 42)).to eq expected_tag.squish
    end

    it 'without round_corners' do
      expected_tag = "<img alt=\"Anton\"
                      class=\"initialjs-avatar\"
                      data-name=\"Anton\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Anton', round_corners: false)).to eq expected_tag.squish
    end

    it 'with char count of 2' do
      expected_tag = "<img alt=\"Lev Nikolayevich\"
                      class=\"initialjs-avatar\"
                      data-name=\"LN\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"2\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Lev Nikolayevich', count: 2)).to eq expected_tag.squish
    end

    it 'with a fixed seed' do
      expected_tag = "<img alt=\"Mikhail\"
                      class=\"initialjs-avatar\"
                      data-name=\"Mikhail\"
                      data-seed=\"1337\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Mikhail', seed: 1337)).to eq expected_tag.squish
    end

    it 'with an extra class' do
      expected_tag = "<img alt=\"Vladimir\"
                      class=\"initialjs-avatar my-funky-class\"
                      data-name=\"Vladimir\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Vladimir', class: 'my-funky-class')).to eq expected_tag.squish
    end

    it 'with a custom color' do
      expected_tag = "<img alt=\"Aleksandr\"
                      class=\"initialjs-avatar\"
                      data-name=\"Aleksandr\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#BADA55\"
                      data-radius=\"13\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Aleksandr', color: '#BADA55')).to eq expected_tag.squish
    end

    it 'with a custom background color' do
      expected_tag = "<img alt=\"Aleksandr\"
                      class=\"initialjs-avatar\"
                      data-name=\"Aleksandr\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-color=\"#BADA55\"
                      data-radius=\"13\"
                      src=\"/images/initialjs-blank.png\">"
      expect(subject.avatar_image('Aleksandr', background_color: '#BADA55')).to eq expected_tag.squish
    end

    def default_avatar_image_result(args = {})
      name = args.fetch(:name)

      tag = "<img alt=\"#{name}\"
            class=\"initialjs-avatar\"
            data-name=\"#{name}\"
            data-seed=\"0\"
            data-height=\"100\"
            data-width=\"100\"
            data-char-count=\"1\"
            data-font-size=\"60\"
            data-text-color=\"#ffffff\"
            data-radius=\"13\"
            src=\"/images/initialjs-blank.png\">"
      tag.squish
    end
  end
end

class HelperClass
  include ActionView::Helpers
  include InitialjsRails::ViewHelpers
end

ValidUser   = Struct.new(:name)
InvalidUser = Struct.new(:nickname)

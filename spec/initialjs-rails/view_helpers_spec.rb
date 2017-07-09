require 'spec_helper'

describe InitialjsRails::ViewHelpers, type: :helper do
  describe '#avatar_image' do
    subject { HelperClass.new }

    it 'generates an image tag for a name string' do
      expected_tag = default_avatar_image_result(name: 'Pancho')
      expect(subject.avatar_image('Pancho')).to eq expected_tag
    end

    it 'generates an image tag for a valid user' do
      user = ValidUser.new('Rigoberta')
      expected_tag = default_avatar_image_result(name: 'Rigoberta')
      expect(subject.avatar_image(user)).to eq expected_tag
    end

    it 'raises ArgumentError for an invalid user' do
      user = InvalidUser.new('Rigoberta')
      expect do
        subject.avatar_image(user)
      end.to raise_error ArgumentError
    end

    it 'with a custom square size' do
      expected_tag = "<img alt=\"Pablo\"
                      class=\"initialjs-avatar\"
                      data-name=\"Pablo\"
                      data-seed=\"0\"
                      data-height=\"42\"
                      data-width=\"42\"
                      data-char-count=\"1\"
                      data-font-size=\"25\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"5\">"
      expect(subject.avatar_image('Pablo', size: 42)).to eq expected_tag.squish
    end

    it 'without round_corners' do
      expected_tag = "<img alt=\"Hulk Hogan\"
                      class=\"initialjs-avatar\"
                      data-name=\"Hulk Hogan\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\">"
      expect(subject.avatar_image('Hulk Hogan', round_corners: false)).to eq expected_tag.squish
    end

    it 'with char count of 2' do
      expected_tag = "<img alt=\"José Luis\"
                      class=\"initialjs-avatar\"
                      data-name=\"JL\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"2\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\">"
      expect(subject.avatar_image('José Luis', count: 2)).to eq expected_tag.squish
    end

    it 'with a fixed seed' do
      expected_tag = "<img alt=\"Pablo\"
                      class=\"initialjs-avatar\"
                      data-name=\"Pablo\"
                      data-seed=\"1337\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\">"
      expect(subject.avatar_image('Pablo', seed: 1337)).to eq expected_tag.squish
    end

    it 'with an extra class' do
      expected_tag = "<img alt=\"Pablo\"
                      class=\"initialjs-avatar my-funky-class\"
                      data-name=\"Pablo\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#ffffff\"
                      data-radius=\"13\">"
      expect(subject.avatar_image('Pablo', class: 'my-funky-class')).to eq expected_tag.squish
    end

    it 'with a custom color' do
      expected_tag = "<img alt=\"Pablo\"
                      class=\"initialjs-avatar\"
                      data-name=\"Pablo\"
                      data-seed=\"0\"
                      data-height=\"100\"
                      data-width=\"100\"
                      data-char-count=\"1\"
                      data-font-size=\"60\"
                      data-text-color=\"#BADA55\"
                      data-radius=\"13\">"
      expect(subject.avatar_image('Pablo', color: '#BADA55')).to eq expected_tag.squish
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
            data-radius=\"13\">"
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

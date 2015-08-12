module InitialjsRails
  class Engine < ::Rails::Engine
    initializer 'initialjs-rails.helper' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end

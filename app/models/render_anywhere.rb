module FfcrmTags
  module RenderAnywhere
    def render(options, assigns = {})
      directory = File.expand_path(File.dirname(__FILE__))
      view_path = File.join(directory,"../",'views')
      viewer = ActionView::Base.new(view_path, assigns,controller_from(model))
      viewer.render(options)
    end

    def template_exists?(path, assigns = {})
      directory = File.expand_path(File.dirname(__FILE__))
      view_path = File.join(directory,"../",'views')
      viewer = ActionView::Base.new(view_path, assigns, controller_from(model))
      viewer.pick_template_extension(path) rescue false
    end
  end
end
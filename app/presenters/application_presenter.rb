class ApplicationPresenter
  def initialize(object, template)
    @object, @template = object, template
  end

  private
    def self.presents(name)
      define_method(name) { @object }
    end

    def h
      @template
    end

    def markdown(text)
      options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end

    def method_missing(*args, &block)
      @template.send(*args, &block)
    end
end

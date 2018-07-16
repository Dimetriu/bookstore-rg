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
      Recarpet::Markdown.new(
        text,
        hard_wrap: true,
        filter_html: true,
        autolink: true
      ).to_html.html_safe
    end

    def method_missing(*args, &block)
      @template.send(*args, &block)
    end
end

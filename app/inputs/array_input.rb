class ArrayInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options[:type] ||= :text

    Array(object.public_send(attribute_name)).map do |elem|
      @builder.text_field(
        nil,
        input_html_options.merge(
          value: elem,
          name: "#{object_name}[#{attribute_name}][]"
        )
      )
    end.join.html_safe
  end
end

module BookAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do

      edit do
        field :category
        field :name
        field :description
        field :price
        field :quantity
        field :year_of_publication
        field :dimensions do
          partial 'dimensions_field'
        end
        field :author_ids, :enum do
          enum do
            Author.all.collect { |a| [a.full_name, a.id] }
          end

          multiple do
            true
          end
        end
        field :materials, :string_array
        field :images do
          partial 'file_upload_field'
        end
      end

      list do
        field :images do
          pretty_value do
            css_class 'thumbnail'
            bindings[:view].tag(:img, {src: bindings[:object].images.first.url})
          end
        end
        field :name
        field :category
        field :price
        field :quantity
      end
    end
  end
end

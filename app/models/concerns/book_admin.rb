module BookAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        configure :attachments do
          hide
        end
      end

      edit do
        field :category
        field :name
        field :description
        field :price
        field :quantity
        field :year_of_publication
        field :dimensions
        field :author_ids, :enum do
          enum do
            Author.all.collect { |a| [a.full_name, a.id] }
          end

          multiple do
            true
          end
        end
        field :materials
        field :images do
          partial 'file_upload_field'
        end
      end
    end
  end
end

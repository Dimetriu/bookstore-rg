module BookAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
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
        field :attachments, :carrierwave
      end
    end
  end
end

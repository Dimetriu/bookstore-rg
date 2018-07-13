class RailsAdminArrayField < RailsAdmin::Config::Fields::Base
  register_instance_option :formated_value do
    value.join(', ')
  end
end

class RailsAdminStringArray < RailsAdminArrayField
  def parse_input(params)
    if params[name].is_a?(::String)
      params[name] = params[name].split(',')
    end
  end
end

class RailsAdminIntArray < RailsAdminArrayField
  def parse_input(params)
    if params[name].is_a?(::String)
      params[name] = params[name].split(',').collect(&:to_i)
    end
  end
end

RailsAdmin::Config::Fields::Types::register(:string_array, RailsAdminStringArray)
RailsAdmin::Config::Fields::Types::register(:integer_array, RailsAdminIntArray)

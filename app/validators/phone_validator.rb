class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
      record.errors[:attribute] << (
        options[:message] || "#{I18n.t 'activerecord.errors.messages.phone_invalid'}"
        )
    end
  end
end

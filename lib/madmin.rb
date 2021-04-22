require "madmin/engine"

require "pagy"

module Madmin
  autoload :Field, "madmin/field"
  autoload :GeneratorHelpers, "madmin/generator_helpers"
  autoload :Resource, "madmin/resource"

  module Fields
    autoload :Array, "madmin/fields/array"
    autoload :Attachment, "madmin/fields/attachment"
    autoload :Attachments, "madmin/fields/attachments"
    autoload :BelongsTo, "madmin/fields/belongs_to"
    autoload :Boolean, "madmin/fields/boolean"
    autoload :Date, "madmin/fields/date"
    autoload :DateTime, "madmin/fields/date_time"
    autoload :Decimal, "madmin/fields/decimal"
    autoload :Enum, "madmin/fields/enum"
    autoload :Float, "madmin/fields/float"
    autoload :HasMany, "madmin/fields/has_many"
    autoload :HasOne, "madmin/fields/has_one"
    autoload :Integer, "madmin/fields/integer"
    autoload :Json, "madmin/fields/json"
    autoload :NestedHasMany, "madmin/fields/nested_has_many"
    autoload :Password, "madmin/fields/password"
    autoload :Polymorphic, "madmin/fields/polymorphic"
    autoload :RichText, "madmin/fields/rich_text"
    autoload :String, "madmin/fields/string"
    autoload :Text, "madmin/fields/text"
    autoload :Time, "madmin/fields/time"
  end

  mattr_accessor :resources, default: []

  class << self
    def resource_for(object)
      Rails.application.eager_load!

      klass_name = object.class.name
      Madmin.resources.find { |r| r.model_name == klass_name }
    end
  end
end

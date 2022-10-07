# frozen_string_literal: true

# BEGIN
module Model

  def self.included(base)
    base.extend Model
  end

  attr_reader :attributes, :attr

  def initialize(attributes = {})
    @attributes = {}
    self.class.attr.each_key do |name|
      @attributes[name] = send("#{name}=", attributes[name])
    end
  end

  def attribute(name, **options)
    @attr ||= {}
    @attr[name] = { **options }

    define_method(name) do
      @attributes[name]
    end

    define_method("#{name}=") do |value|
      value = DateTime.parse(value) if options[:type] == :datetime && !value.nil?

      if @attributes[name] == options[:default]
        return @attributes[name] = value
      end

      @attributes[name] = value || options[:default]
    end
  end
end
# END

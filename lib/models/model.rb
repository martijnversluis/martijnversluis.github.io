class Model
  def initialize(attributes = {})
    @attributes = {}
    assign_attributes(attributes)
  end

  def to_json(opts = {})
    self.class.to_json(@attributes, opts)
  end

  class << self
    def has_many(association_name, model:)
      define_method :"#{association_name}=" do |yamls|
        @attributes[association_name] = model.multiple_from_yaml(yamls)
      end

      define_method association_name do
        @attributes[association_name] || []
      end

      @public_attributes << association_name
    end

    def to_json(attributes, opts = {})
      attributes.slice(public_attributes).to_json(opts)
    end

    def from_yaml(yaml)
      attributes = yaml.transform_keys(&:to_sym).slice(*public_attributes)
      new(attributes)
    end

    def from_data(data)
      multiple_from_yaml(data)
    end

    def multiple_from_yaml(yamls)
      yamls.map { |yaml| from_yaml(yaml) }
    end

    def attributes(*attribute_names)
      @public_attributes = attribute_names

      attribute_names.each do |attribute_name|
        define_attribute(attribute_name)
      end
    end

    def has_attribute?(name)
      public_attributes.include?(name)
    end

    private

    def public_attributes
      @public_attributes ||= []
    end

    def define_attribute(name)
      define_attribute_reader(name)
      define_attribute_writer(name)
    end

    def define_attribute_reader(name)
      define_method name do
        read_attribute(name)
      end
    end

    def define_attribute_writer(name)
      define_method :"#{name}=" do |value|
        @attributes[name] = value
      end
    end
  end

  private

  def read_attribute(name)
    has_attribute?(name) ? @attributes[name] : raise("No such attribute: #{name}")
  end

  def has_attribute?(name)
    self.class.has_attribute?(name)
  end

  def assign_attributes(attributes)
    attributes.each do |name, value|
      assign_attribute(name, value)
    end
  end

  def assign_attribute(name, value)
    public_send(:"#{name}=", value)
  end
end

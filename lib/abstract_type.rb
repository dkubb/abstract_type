# encoding: utf-8

# Module to allow class and methods to be abstract
module AbstractType

  # Hook called when module is included
  #
  # @param [Module] descendant
  #   the module or class including AbstractType
  #
  # @return [undefined]
  #
  # @api private
  def self.included(descendant)
    super
    create_new_method(descendant)
    descendant.extend(AbstractMethodDeclarations)
  end

  private_class_method :included

  # Define the new method on the abstract type
  #
  # Ensures that the instance cannot be of the abstract type
  # and must be a descendant.
  #
  # @param [Class] abstract_class
  #
  # @return [undefined]
  #
  # @api private
  def self.create_new_method(abstract_class)
    abstract_class.define_singleton_method(:new) do |*args, &block|
      if equal?(abstract_class)
        raise NotImplementedError, "#{inspect} is an abstract type"
      else
        super(*args, &block)
      end
    end
  end

  private_class_method :create_new_method

  module AbstractMethodDeclarations

    # Create abstract instance methods
    #
    # @example
    #   class Foo
    #     include AbstractType
    #
    #     # Create an abstract instance method
    #     abstract_method :some_method
    #   end
    #
    # @param [Array<#to_s>] names
    #
    # @return [self]
    #
    # @api public
    def abstract_method(*names)
      names.each { |name| create_abstract_instance_method(name) }
      self
    end

    # Create abstract singleton methods
    #
    # @example
    #   class Foo
    #     include AbstractType
    #
    #     # Create an abstract instance method
    #     abstract_singleton_method :some_method
    #   end
    #
    # @param [Array<#to_s>] names
    #
    # @return [self]
    #
    # @api private
    def abstract_singleton_method(*names)
      names.each { |name| create_abstract_singleton_method(name) }
      self
    end

  private

    # Create abstract singleton method
    #
    # @param [#to_s] name
    #   the name of the method to create
    #
    # @return [undefined]
    #
    # @api private
    def create_abstract_singleton_method(name)
      define_singleton_method(name) do |*|
        raise NotImplementedError, "#{inspect}.#{name} is not implemented"
      end
    end

    # Create abstract instance method
    #
    # @param [#to_s] name
    #   the name of the method to create
    #
    # @return [undefined]
    #
    # @api private
    def create_abstract_instance_method(name)
      define_method(name) do |*|
        raise NotImplementedError, "#{self.class}##{name} is not implemented"
      end
    end

  end # module AbstractMethodDeclarations
end # module AbstractType

require 'abstract_type/version'

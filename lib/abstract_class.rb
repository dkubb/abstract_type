# encoding: utf-8

# Module to allow class and methods to be abstract
module AbstractClass

  # Hook called when module is included
  #
  # @param [Module] descendant
  #   the module or class including AbstractClass
  #
  # @return [self]
  #
  # @api private
  #
  def self.included(descendant)
    super
    descendant.extend(ClassMethods)
    self
  end

  module ClassMethods

    # Instantiate a new object
    #
    # Ensures that the instance cannot be of the abstract class
    # and must be a descendant.
    #
    # @example
    #   object = AbstractClass.new
    #
    # @return [Object]
    #
    # @api public
    #
    def new(*)
      if superclass.equal?(Object)
        raise NotImplementedError, "#{self} is an abstract class"
      else
        super
      end
    end

    # Create abstract instance methods
    #
    # @return [self]
    #
    # @example
    #
    #   class Foo
    #     include Abstract
    #
    #     # Create an abstract instance method
    #     abstract_method :some_method
    #   end
    #
    # @api public
    #
    def abstract_method(*names)
      names.each do |name|
        create_abstract_instance_method(name)
      end

      self
    end

    # Create abstract singleton methods
    #
    #   class Foo
    #     include Abstract
    #
    #     # Create an abstract instance method
    #     abstract_singleton_method :some_method
    #   end
    #
    # @return [self]
    #
    # @api private
    #
    def abstract_singleton_method(*names)
      names.each do |name|
        create_abstract_singleton_method(name)
      end

      self
    end

  private

    # Create abstract signleton method 
    #
    # @param [String|Symbol] name
    #   the name of the method to create
    #
    # @return [undefined]
    #
    # @api private
    #
    def create_abstract_singleton_method(name)
      class_eval(<<-RUBY, __FILE__, __LINE__+1)
        def self.#{name}(*)
          raise NotImplementedError, "\#{name}.\#{__method__} is not implemented"
        end
      RUBY
    end

    # Create abstract instance method 
    #
    # @param [String|Symbol] name
    #   the name of the method to create
    #
    # @return [undefined]
    #
    # @api private
    #
    def create_abstract_instance_method(name)
      class_eval(<<-RUBY, __FILE__, __LINE__+1)
        def #{name}(*)
          raise NotImplementedError, "\#{self.class.name}#\#{__method__} is not implemented"
        end
      RUBY
    end

  end # module ClassMethods
end # module Abstract

module DataStructures
  module TypeChecker
    def verify(object, klass)
      raise "Argument error: object must be from type #{klass}" unless object.kind_of?(klass)
    end
  end
end

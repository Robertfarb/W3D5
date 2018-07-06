class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |attribute_name|
      define_method(attribute_name.to_sym) {instance_variable_get("@#{attribute_name}")}
      define_method("#{attribute_name.to_sym}=") {|value| instance_variable_set( "@#{attribute_name}",value)}
      
    end
  end
end

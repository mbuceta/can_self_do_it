module CanDoIt
module Helper

  def self.class_2_method_sub_str(a_class)
    str = a_class.to_s
    str.respond_to?(:underscore) ?  str.underscore.sub('/','__') : self.underscore(str).sub('/','__')
  end

  def self.underscore(camel_cased_word)
    word = camel_cased_word.to_s.dup
    word.gsub!(/::/, '/')
    word.gsub!(/(?:([A-Za-z\d])|^)(#{/(?=a)b/})(?=\b|[^a-z])/) { "#{$1}#{$1 && '_'}#{$2.downcase}" }
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end

  def self.camelize(string)
    string.sub(/^[a-z\d]*/){$&.capitalize}.gsub(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}"}.gsub('/', '::')
  end

end
end



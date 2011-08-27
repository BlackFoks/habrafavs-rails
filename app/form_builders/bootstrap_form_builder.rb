# Form builder for Bootstrap css framework
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def initialize(object_name, object, template, options, proc)
    super(object_name, object, template, options, proc)
    @object = object
    @t = template
  end

  # replace old methods by new ones
  [:text_field, :email_field, :password_field].each do |method_name|
    # get orig method name
    orig_method_name = ('orig_' + method_name.to_s).to_sym
    # alias method
    alias_method orig_method_name, method_name
    # define new method
    define_method(method_name) do |*args|
      method = args[0] # get model method name
      options = args[1] || {} # get options
      wrap_field(orig_method_name, method, options) # wrap original field
    end
  end

  # Wraps simple form fields (like text, password, email etc) using Bootstrap and all of
  # its features i.e.:
  # * wraps field and label into div.clearfix
  # * supports inline error messages
  # * supports error styling
  # At the output generates following code (for text_field):
  # <div class="clearfix error">
  #   <label for="user_name">Name</label>
  #   <div class="input">
  #     <input class="error" id="user_name" name="user[name]" size="30" type="text" value="">
  #     <span class="help-inline">не может быть пустым</span>
  #   </div>
  # </div>
  def wrap_field(orig_method_name, method, options = {})
    # get orig method
    orig_method = self.method(orig_method_name)
    # has model errors?
    has_errors = !@object.errors[method].empty?

    if has_errors
      # set class for field
      options[:class] ? options[:class] << " error" : options[:class] = "error"

      # add field
      field_with_span = orig_method.call(method, options)
      # add span with error message
      field_with_span += @t.content_tag(:span, @object.errors[method].first, :class => "help-inline")
    else
      field_with_span = orig_method.call(method, options)
    end

    # wrap field with div.input
    field = @t.content_tag(:div, field_with_span, :class => "input")

    # get div class
    div_class = "clearfix"
    div_class << " error" if has_errors
    # wraps in appropriate div.clearfix
    @t.content_tag(:div, label(method) + field, :class => div_class)
  end
end

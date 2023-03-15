# @author: Ackshaey Singh
# @date: 2022-03-09
# @description: Patch to read model attributes if none specified on command line
# (and model exists) with the --with-attributes option.
# @usage: rails g scaffold_controller <MODEL> --with-attributes

require 'rails/generators'

Rails::Generators::NamedBase.class_eval do
  protected

  # Override to get model attributes if none specified on command line.
  #
  # Convert attributes array into GeneratedAttribute objects.
  def parse_attributes!
    if ARGV.include?('--with-attributes') && (!attributes || attributes.empty?)
      self.attributes = gen_model_attributes
    end
    self.attributes = (attributes || []).map do |attr|
      Rails::Generators::GeneratedAttribute.parse(attr)
    end
  end

  private

  # Gets the attributes for a Rails model by querying the
  # model's database table for column information. The method returns
  # the attributes as an array of name:type strings, just like the
  # `rails generate scaffold` command.
  #
  # @return [Array<String>] the attributes for the model
  # @raise [StandardError] if there is a problem with the model
  def gen_model_attributes
    model = ARGV.find do |arg|
      arg =~ /--model-name=/
    end&.to_s&.split('=')&.last&.constantize || class_name.to_s.constantize

    # Filter out the attributes we don't want to include
    # (id and timestamps)
    model.columns.reject { |a| a.name == 'id' || a.name.end_with?('_at') }.map do |a|
      # Convert the attribute type to a string
      type = model.type_for_attribute(a.name).to_s

      # Return the attribute name and type as a string
      "#{a.name}:#{type}"
    end
  end
end
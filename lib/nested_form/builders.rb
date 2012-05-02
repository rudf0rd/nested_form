require 'nested_form/builder_mixin'

module NestedForm
  class Builder < ::ActionView::Helpers::FormBuilder
    include ::NestedForm::BuilderMixin
  end

  begin
    require 'simple_form'
    class SimpleBuilder < ::SimpleForm::FormBuilder
      include ::NestedForm::BuilderMixin
    end
  rescue LoadError
  end

  begin
    require 'formtastic'
    if defined?(FormtasticBootstrap::FormBuilder)
      builder = FormtasticBootstrap::FormBuilder
    end
    
    builder ||= defined?(::Formtastic::FormBuilder) ? Formtastic::FormBuilder : ::Formtastic::SemanticFormBuilder
    class FormtasticBuilder < builder
      include ::NestedForm::BuilderMixin
    end
  rescue LoadError
  end
end

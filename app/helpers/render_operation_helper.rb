module RenderOperationHelper
  def render_form(action, options = {})
    flash_render(options)
    @operation_result = options.fetch(:result, (result || {}))
    render html: concept("#{cell_path}/cell/#{action}",
                         @operation_result['model'], render_options(options)),
           layout: options.fetch(:layout, true)
  end

  def render_options(options)
    {
      form: @operation_result['contract.default'],
      result: options[:result_obj]
    }.compact
  end

  def flash_render(options)
    flash.now.notice = options[:notice] if options[:notice]
    flash.now.alert = options[:alert] if options[:alert]
  end

  def cell_path
    self.class.instance_variable_get('@path') || params['controller'].singularize
  end
end

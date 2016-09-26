require 'csv'
module CsvControllerMixin
  extend ActiveSupport::Concern

  #http://vaidehijoshi.github.io/blog/2015/10/13/stop-worrying-and-start-being-concerned-activesupport-concerns/

  def import
    @model_name = controller_name.classify
    logger.info("mixin ---> model name is #{@model_name}")

    @model_name.constantize.importCSV(params[:file])
    redirect_to :action => 'index', notice: "import Complete"
  end

  module ClassMethods   
  end

  module InstanceMethods
  end
  
end    
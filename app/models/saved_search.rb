class SavedSearch < ActiveRecord::Base

  before_save :set_available_fields
  serialize :available_fields
  serialize :query_parameters
  serialize :display_fields

  def set_available_fields
    attributes = Array.new
    for attribute in eval(self.model_name).columns
      attributes << attribute.name
    end
    self.available_fields = attributes
    validate_fields
  end

  # Perform the query that is specified in the query_parameters attribute
  def execute_query
    query_parameters = self.query_parameters
    query_parameters.delete(:redirect_controller)
    query_parameters.delete(:redirect_action)
    query_parameters.delete(:saved_search_id)
    sql = "#{query_parameters}"
    eval(self.model_name).where(eval(sql))
  end

  # This method translates the inputs from the form into the correct
  # datatypes for the search model.  For instance, "0" is returned
  # by the form, but it should be "false" in the search model.
  def validate_fields
    for key in self.query_parameters.keys
      for column in eval("#{self.model_name}").columns
        if key == column.name.to_sym
          if column.type == :boolean
            if self.query_parameters[key] == "0"
              self.query_parameters[key] = false
            else
              self.query_parameters[key] = true
            end
          end
        end
      end
    end
  end



end

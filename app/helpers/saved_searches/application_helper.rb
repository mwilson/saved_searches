module SavedSearches
  module ApplicationHelper
 def render_table(id)
     saved_search = SavedSearch.find(id)
     if saved_search.display_fields.nil?
       fields = saved_search.available_fields
     else
       fields = saved_search.display_fields
     end
     str = "<table class='tablesorter'>"
     str << "<thead>"
     str << "<tr>"
     for header in fields
       str << "<th>#{header[:label]}</th>"
     end
     str << "<tr>"
     str << "</thead>"
     str << "<tbody>"
     for data in saved_search.execute_query
       str << "<tr>"
       for field in fields
         if field.class == Hash
           text = eval("data.#{field[:name]}")
         else
           text = eval("data.#{field}")
         end
         str << "<td>#{text}</td>"
       end
       str << "<td><a href='/#{saved_search.model_name.underscore.pluralize}/#{eval("data.id")}/edit'>Edit</a></td>"
       str << "</tr>"
     end
     str << "</tbody>"
     str << "</table>"
     str << "<p>Using Saved Search: #{saved_search.id}</p>"
     str.html_safe
   end
  end
end

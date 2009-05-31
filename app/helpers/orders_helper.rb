module OrdersHelper
  def order_state_title(o)
    t( %Q{orders.text.#{o.order_state.name}_title} )
  end

  def order_state_text(o)
    case o.order_state.name
      when 'needs' then t( 'orders.text.needs' )
      else              %Q{ #{t( %Q{orders.text.#{o.order_state.name}_at} )} #{l(o.updated_at, :format => :date)} }
    end
  end

  def order_edit_text(o)
      t( 'components.edit.current_order', :count => o.count, :order => t( %Q{orders.text.#{o.order_state.name}} ) )
  end
end

module ComponentsHelper
  def order_state(o)
    if o
      if o.order_state.name == 'supplies'
        false
      else
        true
      end
    else
      false
    end
  end

  def stock_count( c, all )
    count = 0
    for p in c.prizes
      for o in p.orders
        if all || o.order_state.name == 'supplies'
          count += o.count
        else
          c.order = o
        end
      end
    end

    for s in c.stocks
      count += s.count unless s.blank?
    end

    for pc in c.project_components
      count -= pc.count unless pc.blank?
    end

    return count
  end
end

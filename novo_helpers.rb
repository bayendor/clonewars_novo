module NovoHelpers
  def find_products
    PRODUCTS.select_all
  end

  def find_african_products
    PRODUCTS.select_all_by_region("Africa")
  end

  def find_central_am_products
    PRODUCTS.select_all_by_region("Central America")
  end

  def find_south_am_products
    PRODUCTS.select_all_by_region("South America")
  end

  def find_pacific_products
    PRODUCTS.select_all_by_region("Pacific")
  end

  def find_alternative_products
    PRODUCTS.select_all_by_that_are_not("regular", "accessories", "subscription")
  end

  def find_accessories
    PRODUCTS.select_all_by_type("accessories")
  end

  def find_subscriptions
    PRODUCTS.select_all_by_type("subscription")
  end

  def find_by_id(id)
    PRODUCTS.select_by_id(id)
  end

  def update_product(id, params)
    PRODUCTS.update(id, params)
  end

  def delete_product(id)
    PRODUCTS.delete(id)
  end
end

# frozen_string_literal: true

# Helper methods for Sells Business Logic
module SellsHelper
  def self.read(
    salesperson_name: nil,
    costumer_email: nil,
    from: nil,
    to: nil,
    product_code: nil,
    city: nil,
    state: nil,
    page: 0,
    page_size: 50
  )
    result = Sell.all

    result = result.where(state: state) if state.present?
    result = result.where(city: city) if city.present?
    result = result.where(sold_at: DateTime.parse(from).beginning_of_day..) if from.present?
    result = result.where(sold_at: ..DateTime.parse(to).end_of_day) if to.present?

    if salesperson_name.present?
      result = result
               .joins(:salesperson)
               .where('salespeople.name ILIKE :query', { query: "%#{salesperson_name}%" })

    end

    if costumer_email.present?
      result = result
               .joins(:costumer)
               .where(email: costumer_email)
    end

    if product_code.present?
      result = result
               .left_outer_joins(:product)
               .where('products.code = ?', product_code)

    end

    paged_formatted(result, page: page, page_size: page_size)
  end

  def self.paged_formatted(query, page: 0, page_size: 50)
    total = query.count

    sells = query.limit(page_size).offset(page_size * page)

    {
      'sells': sells.as_json(include: %i[salesperson costumer product]),
      'page': page,
      'page_size': page_size,
      'total': total
    }
  end
end

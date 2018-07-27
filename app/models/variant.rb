class Variant < ApplicationRecord
  belongs_to :product, optional: true
  validates :stock, numericality: { :greater_than_or_equal_to => 0 }
  scope :in_stock, -> { where("stock > 0") }

  def send_gift
    decrement!(:stock)
  end

  def stock_information
    return '' unless stock.positive?

    message = 'last '
    message << if near_to_the_end?
                "<b style='color:red;'>#{stock}</b> "
              else
                "<b>#{stock}</b> "
              end
    message << "for <b>#{name}</b> variant"
    message.html_safe
  end

  private

  def near_to_the_end?
    stock < 4
  end
end

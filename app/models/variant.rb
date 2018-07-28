class Variant < ApplicationRecord
  belongs_to :product, optional: true

  def send_gift(email)
    if decrement!(:stock)
      SendGiftMailer.send_gift(email).deliver_later
    end
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

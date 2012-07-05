class ConvertionMailer < ActionMailer::Base
  default from: "noreply@pr.aiit.ac.jp"

  def conversion(customer)
    @customer = customer
    mail(to: "yc@aiit.ac.jp", subject: "conversion")
  end
end

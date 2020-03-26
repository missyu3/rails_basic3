class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "mitutaka1283@yahoo.co.jp", subject: "投稿内容の確認メール"
  end
end

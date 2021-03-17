# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  
  def send_mail
    inquiry = Inquiry.new(name: "ルビー太郎", email: "example.com", subject:{"通報"=> 0}, message: "テスト")
    InquiryMailer.send_mail(inquiry)
  end  
end

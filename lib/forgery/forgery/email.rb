class Forgery::Email < Forgery

  def self.address(max_length=nil)
    Forgery::Internet.email_address(max_length)
  end

  def self.subject(options={})
    Forgery::LoremIpsum.title(options)
  end

  def self.body(options={})
    quantity = options[:quantity] || (1 + rand(10))
    Forgery::LoremIpsum.paragraphs(quantity, options)
  end

end

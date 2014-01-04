class Forgery::Internet < Forgery

  def self.user_name
    (dictionaries[:male_first_names].random[0,1] + dictionaries[:last_names].random).downcase
  end

  def self.top_level_domain
    dictionaries[:top_level_domains].random.unextend
  end

  def self.domain_name(max_length=nil)
    suffix = '.' + self.top_level_domain
    company_name = dictionaries[:company_names].random.downcase

    if(!max_length.nil?)
      company_name = company_name.slice(0, (max_length - suffix.length))
    end

    company_name + suffix
  end

  def self.email_address(max_length=nil)
    prefix = user_name + '@'
    suffix_max_length = (max_length) ? max_length - prefix.length : nil

    prefix + domain_name(suffix_max_length)
  end

  def self.email_subject(options={})
    Forgery::LoremIpsum.title(options)
  end

  def self.cctld
    dictionaries[:country_code_top_level_domains].random.unextend
  end

  def self.ip_v4
    (1..4).map{rand(256)}.join('.')
  end

end

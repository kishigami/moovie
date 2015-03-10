class Scraping 

  def self.scraping(link)
    agent = Mechanize.new
    page = agent.get("http://eiga.com" + link)
    title = page.at('.moveInfoBox h1').inner_text if page.at('.moveInfoBox h1')
    image_link = page.at('.mainBox .pictBox a img').get_attribute('src') if page.at('.mainBox .pictBox a img')
    director_name = page.at('.staffBox .f a span').inner_text if page.at('.staffBox .f a span')
    movie_detail = page.at('.outline p').inner_text if page.at('.outline p')
    open_date = page.at('.opn_date strong').inner_text if page.at('.opn_date strong')

    product = Product.where(title: title).first_or_initialize
    product.image_url = image_link
    product.director = director_name
    product.detail = movie_detail
    product.open_date = open_date
    product.save
  end


  def self.get_links
    next_page = "/now"
    while next_page != nil do
      links = []
      agent = Mechanize.new
      main_page = agent.get("http://eiga.com"+ next_page)
      elements = main_page.search('.m_unit h3 a')

      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      links.each do |link|
        scraping(link)
      end
      next_page = main_page.at('.next_page').get_attribute('href')
    end
  end
  



end

class HomeController < ApplicationController
  def index
    #search the brand
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    #debugger

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |brand_params|
      if Brand.where(name: brand_params["Nome"]).size == 0
        Brand.create(name: brand_params["Nome"], webmotors_brand_id: brand_params["id"])
      end
    end
  end
end

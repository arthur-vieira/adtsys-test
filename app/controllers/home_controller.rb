class HomeController < ApplicationController
  include Webmotors

  def index
    #search the brand
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    #debugger

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |brand_params|
      next if brand_params["Nome"].blank? || Brand.find_by(name: brand_params["Nome"])
      Brand.create(name: brand_params["Nome"], webmotors_brand_id: brand_params["Id"])
    end
  end
end

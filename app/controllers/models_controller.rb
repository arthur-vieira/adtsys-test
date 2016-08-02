class ModelsController < ApplicationController
  include Webmotors

  def index
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    brand = Brand.where(webmotors_brand_id: params[:webmotors_brand_id])[0]

    response = Net::HTTP.post_form(uri, { marca: params[:webmotors_brand_id] })
    models_json = JSON.parse response.body

    # debugger

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      if Model.where(name: json["Nome"], brand_id: brand.id).size == 0
        Model.create(brand_id: brand.id, name: json["Nome"])
      end
    end
  end
end

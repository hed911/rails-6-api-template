class V1::ServicesController < ApplicationController
  #before_action :authenticate_user
  #before_action :find_service, except: %i[create index]

  # GET /users
  def index
    items = []
    10.times.each do
      items << {
        id: Faker::Number.number(digits: 10),
        estado: Faker::Cannabis.type,
        tipo: Faker::Cannabis.cannabinoid,
        categoria: Faker::Cannabis.category,
        categoria_enum: Faker::Number.between(from: 1, to: 2),
        empresa_asignada: Faker::Company.bs,
        solicitante: Faker::Name.name,
        fecha: Faker::Date.in_date_period,
      }
    end
    internal_response = { total: 400, total_pages: 40, items: items }
    response = { status: "success", data: internal_response, message: "OK" }
    render json: response.to_json, status: :ok
  end

  def service_params
    params.permit(
      :page, :size
    )
  end
end

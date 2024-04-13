
class FeatureController < ApplicationController


  def pagination_dict(object)
    {
      current_page: object.current_page,
      total_pages: object.total_pages,
      per_page: object.per_page
    }
  end

  def index
    mag_types_filter = params[:mag_type]&.split(',') || []
    per_page = params[:per_page].to_i


    if mag_types_filter.empty?
      features = Feature.all.paginate(page: params[:page], per_page: params[:per_page])
    else
      features = Feature.where(mag_type: mag_types_filter).paginate(page: params[:page], per_page: params[:per_page])
    end

    if per_page > 1000
      render json: { error: "El parámetro per_page debe ser menor que 1000" }, status: :unprocessable_entity
    else


      features_serializados = features.map { |feature| FeatureSerializer.new(feature) }

      render json: [data: features_serializados, pagination: pagination_dict(features)]
    end


  end
end

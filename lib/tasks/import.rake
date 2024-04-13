namespace :import do
  desc "Import data from URL"
  task data: :environment do
      require 'net/http'
      require 'json'

      url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

      begin
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == "https"

        request = Net::HTTP::Get.new(uri.request_uri)

        response = http.request(request)

        if response.is_a?(Net::HTTPSuccess)
          # La solicitud fue exitosa
          geojson = JSON.parse(response.body)
          features = geojson['features']

          features.each do |feature|
            # Procesar cada objeto 'feature' y guardar en la base de datos
            data_to_save = {
              external_id: feature['id'],
              magnitude: feature['properties']['mag'],
              place: feature['properties']['place'],
              time: feature['properties']['time'],
              external_url: feature['properties']['url'],
              tsunami: feature['properties']['tsunami'],
              mag_type: feature['properties']['magType'],
              title: feature['properties']['title'],
              latitude: feature['geometry']['coordinates'][0],
              longitude: feature['geometry']['coordinates'][1],
              inherited_type: feature['type']
            }



            # Validar los campos requeridos y rangos
            next if data_to_save[:title].nil? || data_to_save[:external_url].nil? || data_to_save[:place].nil? || data_to_save[:mag_type].nil?
            next if data_to_save[:magnitude] < -1.0 || data_to_save[:magnitude] > 10.0
            next if data_to_save[:latitude] < -90.0 || data_to_save[:latitude] > 90.0
            next if data_to_save[:longitude] < -180.0 || data_to_save[:longitude] > 180.0

            # Evitar duplicados
            next if Feature.exists?(external_id: data_to_save[:external_id])




            Feature.create(data_to_save)
          end

          puts "GeoJSON 'features' data imported successfully!"


        else
          # La solicitud falló
          raise "Error al descargar GeoJSON: #{response.code} #{response.message}"
        end
      rescue StandardError => e
        # Manejar el error
        puts "Error:", e.message
      end



        end
end

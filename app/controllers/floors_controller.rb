# waffles-muggles
#
# CS 5150 Navigation in Library Stacks.
#
# OpenAPI spec version: 1.0.0
#
# Generated by: https://github.com/swagger-api/swagger-codegen.git
#
class FloorsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:floors_put]

    def index
        ret = []
        Floor.find_each do |floor|
            if floor.library == params[:library_id].to_i
                library = Library.find(floor.library)
                ret << {
                    id: floor.id,
                    name: floor.name,
                    size_x: floor.size_x,
                    size_y: floor.size_y,
                    geojson: floor.geojson,
                    library: {
                        id: library.id,
                        name: library.name,
                        latitude: library.latitude,
                        longitude: library.longitude
                    }
                }
            end
        end
        render json: ret
    end

    def destroy
        Floor.find(params[:id]).destroy
        render json: 'OK'.to_json
    end

    def show
        floor = Floor.find(params[:id])
        library = Library.find(floor.library)

        render json: {
            id: floor.id,
            name: floor.name,
            size_x: floor.size_x,
            size_y: floor.size_y,
            geojson: floor.geojson,
            library: {
                id: library.id,
                name: library.name,
                latitude: library.latitude,
                longitude: library.longitude
            }
        }
    end

    def create
        floor = Floor.new
        floor.name = params[:name]
        floor.size_x = params[:size_x]
        floor.size_y = params[:size_y]
        floor.geojson = params[:geojson]
        floor.library = params[:library]
        floor.save
        render json: 'OK'.to_json
    end

    def floors_put
        puts params[:name]
        floor = Floor.find(params[:id])
        floor.name = params[:name]
        floor.size_x = params[:size_x]
        floor.size_y = params[:size_y]
        floor.geojson = params[:geojson]
        floor.library = params[:library]
        floor.save
        render json: 'OK'.to_json
    end
end

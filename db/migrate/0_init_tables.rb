# waffles-muggles
#
# CS 5150 Navigation in Library Stacks.
#
# OpenAPI spec version: 1.0.0
#
# Generated by: https://github.com/swagger-api/swagger-codegen.git
#

class InitTables < ActiveRecord::Migration[5.0]
    def change
        create_table 'error'.pluralize.to_sym, id: false do |t|
            t.integer :code
            t.string :message
            t.string :fields

            t.timestamps
        end

        create_table 'floor'.pluralize.to_sym, id: false do |t|
            t.integer :id
            t.string :name
            t.integer :size_x
            t.integer :size_y
            t.string :geojson
            t.string :ref
            t.integer :library

            t.timestamps

            t.primary_key :id
        end

        create_table 'library'.pluralize.to_sym, id: false do |t|
            t.integer :id
            t.string :name
            t.string :latitude
            t.string :longitude

            t.timestamps

            t.primary_key :id
        end

        create_table 'rule'.pluralize.to_sym, id: false do |t|
            t.string :rule_type
            t.integer :rule_id
            t.string :call_number
            t.string :rule

            t.timestamps

            t.primary_key :rule_id
        end

        create_table 'search_result'.pluralize.to_sym, id: false do |t|
            t.string :result_type
            t.integer :result_id
            t.string :result

            t.timestamps

            t.primary_key :result_id
        end

        create_table 'stack'.pluralize.to_sym, id: false do |t|
            t.integer :id
            t.integer :cx
            t.integer :cy
            t.integer :lx
            t.integer :ly
            t.integer :rotation
            t.string :start_class
            t.integer :start_subclass
            t.string :start_subclass2
            t.string :end_class
            t.integer :end_subclass
            t.string :end_subclass2
            t.integer :oversize
            t.integer :floor

            t.timestamps

            t.primary_key :id
        end
      end
end

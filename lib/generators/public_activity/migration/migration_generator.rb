require 'generators/public_activity'
require 'rails/generators/active_record'

module PublicActivity
  module Generators
    # Migration generator that creates migration file from template
    class MigrationGenerator < ActiveRecord::Generators::Base
      extend Base

      argument :name, :type => :string, :default => 'create_activities'
      argument :model_name, :type => :string, :default => 'activity'

      # Create migration in project's folder
      def generate_files
        migration_template 'migration.rb', "db/migrate/#{name}"
      end
    end
  end
end
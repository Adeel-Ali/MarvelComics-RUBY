# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/27/2016

module MarvelComics
  class ComicSummary

    # The path to the individual comic resource.
    # @return [String]
    attr_accessor :resource_uri

    # The canonical name of the comic.
    # @return [String]
    attr_accessor :name

    def initialize(resource_uri = nil,
                   name = nil)
      @resource_uri = resource_uri
      @name = name

    end

    def method_missing(method_name)
      puts "There is no method called '#{method_name}'."
    end

    # Creates JSON of the curent object
    def to_json(options = {})
      hash = key_map
      hash.to_json(options)
    end

    # Creates an instance of the object from a hash
    def self.from_hash(hash)
      if hash == nil
        nil
      else
        # Extract variables from the hash
        resource_uri = hash["resourceURI"]
        name = hash["name"]
        # Create object from extracted values
        ComicSummary.new(resource_uri,
                         name)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['resourceURI'] = resource_uri
      hash['name'] = name
      hash
    end
  end
end

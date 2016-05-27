# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/27/2016

module MarvelComics
  class EventList

    # The number of total available events in this list. Will always be greater than or equal to the "returned" value.
    # @return [Integer]
    attr_accessor :available

    # The number of events returned in this collection (up to 20).
    # @return [Integer]
    attr_accessor :returned

    # The path to the full list of events in this collection.
    # @return [String]
    attr_accessor :collection_uri

    # The list of returned events in this collection.
    # @return [List of EventSummary]
    attr_accessor :items

    def initialize(available = nil,
                   returned = nil,
                   collection_uri = nil,
                   items = nil)
      @available = available
      @returned = returned
      @collection_uri = collection_uri
      @items = items

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
        available = hash["available"]
        returned = hash["returned"]
        collection_uri = hash["collectionURI"]
        # Parameter is an array, so we need to iterate through it
        items = nil
        if hash["items"] != nil
          items = Array.new
          hash["items"].each{|structure| items << EventSummary.from_hash(structure)}
        end
        # Create object from extracted values
        EventList.new(available,
                      returned,
                      collection_uri,
                      items)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['available'] = available
      hash['returned'] = returned
      hash['collectionURI'] = collection_uri
      hash['items'] = items.map(&:key_map)
      hash
    end
  end
end

# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/27/2016

module MarvelComics
  class SeriesDataContainer

    # The requested offset (number of skipped results) of the call.
    # @return [Integer]
    attr_accessor :offset

    # The requested result limit.
    # @return [Integer]
    attr_accessor :limit

    # The total number of resources available given the current filter set.
    # @return [Integer]
    attr_accessor :total

    # The total number of results returned by this call.
    # @return [Integer]
    attr_accessor :count

    # The list of series returned by the call
    # @return [List of Series]
    attr_accessor :results

    def initialize(offset = nil,
                   limit = nil,
                   total = nil,
                   count = nil,
                   results = nil)
      @offset = offset
      @limit = limit
      @total = total
      @count = count
      @results = results

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
        offset = hash["offset"]
        limit = hash["limit"]
        total = hash["total"]
        count = hash["count"]
        # Parameter is an array, so we need to iterate through it
        results = nil
        if hash["results"] != nil
          results = Array.new
          hash["results"].each{|structure| results << Series.from_hash(structure)}
        end
        # Create object from extracted values
        SeriesDataContainer.new(offset,
                                limit,
                                total,
                                count,
                                results)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['offset'] = offset
      hash['limit'] = limit
      hash['total'] = total
      hash['count'] = count
      hash['results'] = results.map(&:key_map)
      hash
    end
  end
end

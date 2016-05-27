# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/27/2016

module MarvelComics
  class StoriesController < BaseController
    @@instance = StoriesController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # Fetches a single comic story by id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @return Story response from the API call
    def get_story_individual(story_id)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 404
        raise APIException.new 'Story not found.', 404, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          Story.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of characters filtered by a story id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @param [String] comics Optional parameter: Return only characters which appear in the specified comics (accepts a comma-separated list of ids).
    # @param [String] events Optional parameter: Return only characters which appear comics that took place in the specified events (accepts a comma-separated list of ids).
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] modified_since Optional parameter: Return only characters which have been modified since the specified date.
    # @param [String] name Optional parameter: Return only characters matching the specified full character name (e.g. Spider-Man).
    # @param [String] name_starts_with Optional parameter: Return characters with names that begin with the specified string (e.g. Sp).
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "name", "modified", "-name", "-modified")
    # @param [String] series Optional parameter: Return only characters which appear the specified series (accepts a comma-separated list of ids).
    # @return CharacterDataWrapper response from the API call
    def get_character_collection_by_story_id(story_id, 
                                             comics = nil, 
                                             events = nil, 
                                             limit = nil, 
                                             modified_since = nil, 
                                             name = nil, 
                                             name_starts_with = nil, 
                                             offset = nil, 
                                             order_by = nil, 
                                             series = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}/characters'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'comics' => comics,
        'events' => events,
        'limit' => limit,
        'modifiedSince' => modified_since,
        'name' => name,
        'nameStartsWith' => name_starts_with,
        'offset' => offset,
        'orderBy' => order_by,
        'series' => series,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          CharacterDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of comics filtered by a story id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @param [String] characters Optional parameter: Return only comics which feature the specified characters (accepts a comma-separated list of ids).
    # @param [String] collaborators Optional parameter: Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work).
    # @param [String] creators Optional parameter: Return only comics which feature work by the specified creators (accepts a comma-separated list of ids).
    # @param [DateDescriptorEnum] date_descriptor Optional parameter: Return comics within a predefined date range.
    # @param [String] date_range Optional parameter: Return comics within a predefined date range.  Dates must be specified as date1,date2 (e.g. 2013-01-01,2013-01-02).  Dates are preferably formatted as YYYY-MM-DD but may be sent as any common date format.
    # @param [String] diamond_code Optional parameter: Filter by diamond code.
    # @param [String] digital_id Optional parameter: Filter by digital comic id.
    # @param [String] ean Optional parameter: Filter by EAN.
    # @param [String] events Optional parameter: Return only comics which take place in the specified events (accepts a comma-separated list of ids).
    # @param [String] format Optional parameter: Filter by the issue format (e.g. comic, digital comic, hardcover). (Acceptable values are: "comic", "magazine", "trade paperback", "hardcover", "digest", "graphic novel", "digital comic", "infinite comic")
    # @param [FormatTypeEnum] format_type Optional parameter: Filter by the issue format type (comic or collection).
    # @param [String] has_digital_issue Optional parameter: Include only results which are available digitally. (Acceptable values are: "true")
    # @param [String] isbn Optional parameter: Filter by ISBN.
    # @param [String] issn Optional parameter: Filter by ISSN.
    # @param [String] issue_number Optional parameter: Return only issues in series whose issue number matches the input.
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] modified_since Optional parameter: Return only comics which have been modified since the specified date.
    # @param [String] no_variants Optional parameter: Exclude variant comics from the result set. (Acceptable values are: "true")
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "focDate", "onsaleDate", "title", "issueNumber", "modified", "-focDate", "-onsaleDate", "-title", "-issueNumber", "-modified")
    # @param [String] series Optional parameter: Return only comics which are part of the specified series (accepts a comma-separated list of ids).
    # @param [String] shared_appearances Optional parameter: Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear).
    # @param [String] start_year Optional parameter: Return only issues in series whose start year matches the input.
    # @param [String] title Optional parameter: Return only issues in series whose title matches the input.
    # @param [String] title_starts_with Optional parameter: Return only issues in series whose title starts with the input.
    # @param [String] upc Optional parameter: Filter by UPC.
    # @return ComicDataWrapper response from the API call
    def get_comics_collection_by_story_id(story_id, 
                                          characters = nil, 
                                          collaborators = nil, 
                                          creators = nil, 
                                          date_descriptor = nil, 
                                          date_range = nil, 
                                          diamond_code = nil, 
                                          digital_id = nil, 
                                          ean = nil, 
                                          events = nil, 
                                          format = nil, 
                                          format_type = nil, 
                                          has_digital_issue = nil, 
                                          isbn = nil, 
                                          issn = nil, 
                                          issue_number = nil, 
                                          limit = nil, 
                                          modified_since = nil, 
                                          no_variants = nil, 
                                          offset = nil, 
                                          order_by = nil, 
                                          series = nil, 
                                          shared_appearances = nil, 
                                          start_year = nil, 
                                          title = nil, 
                                          title_starts_with = nil, 
                                          upc = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}/comics'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'characters' => characters,
        'collaborators' => collaborators,
        'creators' => creators,
        'dateDescriptor' => date_descriptor,
        'dateRange' => date_range,
        'diamondCode' => diamond_code,
        'digitalId' => digital_id,
        'ean' => ean,
        'events' => events,
        'format' => format,
        'formatType' => format_type,
        'hasDigitalIssue' => has_digital_issue,
        'isbn' => isbn,
        'issn' => issn,
        'issueNumber' => issue_number,
        'limit' => limit,
        'modifiedSince' => modified_since,
        'noVariants' => no_variants,
        'offset' => offset,
        'orderBy' => order_by,
        'series' => series,
        'sharedAppearances' => shared_appearances,
        'startYear' => start_year,
        'title' => title,
        'titleStartsWith' => title_starts_with,
        'upc' => upc,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          ComicDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of creators filtered by a story id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @param [String] comics Optional parameter: Return only creators who worked on in the specified comics (accepts a comma-separated list of ids).
    # @param [String] events Optional parameter: Return only creators who worked on comics that took place in the specified events (accepts a comma-separated list of ids).
    # @param [String] first_name Optional parameter: Filter by creator first name (e.g. brian).
    # @param [String] first_name_starts_with Optional parameter: Filter by creator first names that match critera (e.g. B, St L).
    # @param [String] last_name Optional parameter: Filter by creator last name (e.g. Bendis).
    # @param [String] last_name_starts_with Optional parameter: Filter by creator last names that match critera (e.g. Ben).
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] middle_name Optional parameter: Filter by creator middle name (e.g. Michael).
    # @param [String] middle_name_starts_with Optional parameter: Filter by creator middle names that match critera (e.g. Mi).
    # @param [String] modified_since Optional parameter: Return only creators which have been modified since the specified date.
    # @param [String] name_starts_with Optional parameter: Filter by creator names that match critera (e.g. B, St L).
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "lastName", "firstName", "middleName", "suffix", "modified", "-lastName", "-firstName", "-middleName", "-suffix", "-modified")
    # @param [String] series Optional parameter: Return only creators who worked on the specified series (accepts a comma-separated list of ids).
    # @param [String] suffix Optional parameter: Filter by suffix or honorific (e.g. Jr., Sr.).
    # @return CreatorDataWrapper response from the API call
    def get_creator_collection_by_story_id(story_id, 
                                           comics = nil, 
                                           events = nil, 
                                           first_name = nil, 
                                           first_name_starts_with = nil, 
                                           last_name = nil, 
                                           last_name_starts_with = nil, 
                                           limit = nil, 
                                           middle_name = nil, 
                                           middle_name_starts_with = nil, 
                                           modified_since = nil, 
                                           name_starts_with = nil, 
                                           offset = nil, 
                                           order_by = nil, 
                                           series = nil, 
                                           suffix = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}/creators'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'comics' => comics,
        'events' => events,
        'firstName' => first_name,
        'firstNameStartsWith' => first_name_starts_with,
        'lastName' => last_name,
        'lastNameStartsWith' => last_name_starts_with,
        'limit' => limit,
        'middleName' => middle_name,
        'middleNameStartsWith' => middle_name_starts_with,
        'modifiedSince' => modified_since,
        'nameStartsWith' => name_starts_with,
        'offset' => offset,
        'orderBy' => order_by,
        'series' => series,
        'suffix' => suffix,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          CreatorDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of events filtered by a story id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @param [String] characters Optional parameter: Return only events which feature the specified characters (accepts a comma-separated list of ids).
    # @param [String] comics Optional parameter: Return only events which take place in the specified comics (accepts a comma-separated list of ids).
    # @param [String] creators Optional parameter: Return only events which feature work by the specified creators (accepts a comma-separated list of ids).
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] modified_since Optional parameter: Return only events which have been modified since the specified date.
    # @param [String] name Optional parameter: Filter the event list by name.
    # @param [String] name_starts_with Optional parameter: Return events with names that begin with the specified string (e.g. Sp).
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "name", "startDate", "modified", "-name", "-startDate", "-modified")
    # @param [String] series Optional parameter: Return only events which are part of the specified series (accepts a comma-separated list of ids).
    # @return EventDataWrapper response from the API call
    def get_events_collection_by_story_id(story_id, 
                                          characters = nil, 
                                          comics = nil, 
                                          creators = nil, 
                                          limit = nil, 
                                          modified_since = nil, 
                                          name = nil, 
                                          name_starts_with = nil, 
                                          offset = nil, 
                                          order_by = nil, 
                                          series = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}/events'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'characters' => characters,
        'comics' => comics,
        'creators' => creators,
        'limit' => limit,
        'modifiedSince' => modified_since,
        'name' => name,
        'nameStartsWith' => name_starts_with,
        'offset' => offset,
        'orderBy' => order_by,
        'series' => series,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          EventDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of series filtered by a story id.
    # @param [String] story_id Required parameter: Filter by story id.
    # @param [String] characters Optional parameter: Return only series which feature the specified characters (accepts a comma-separated list of ids).
    # @param [String] comics Optional parameter: Return only series which contain the specified comics (accepts a comma-separated list of ids).
    # @param [String] contains Optional parameter: Return only series containing one or more comics with the specified format. (Acceptable values are: "comic", "magazine", "trade paperback", "hardcover", "digest", "graphic novel", "digital comic", "infinite comic")
    # @param [String] creators Optional parameter: Return only series which feature work by the specified creators (accepts a comma-separated list of ids).
    # @param [String] events Optional parameter: Return only series which have comics that take place during the specified events (accepts a comma-separated list of ids).
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] modified_since Optional parameter: Return only series which have been modified since the specified date.
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "title", "modified", "startYear", "-title", "-modified", "-startYear")
    # @param [String] series_type Optional parameter: Filter the series by publication frequency type. (Acceptable values are: "collection", "one shot", "limited", "ongoing")
    # @param [String] start_year Optional parameter: Return only series matching the specified start year.
    # @param [String] title Optional parameter: Filter by series title.
    # @param [String] title_starts_with Optional parameter: Return series with titles that begin with the specified string (e.g. Sp).
    # @return SeriesDataWrapper response from the API call
    def get_story_series_collection(story_id, 
                                    characters = nil, 
                                    comics = nil, 
                                    contains = nil, 
                                    creators = nil, 
                                    events = nil, 
                                    limit = nil, 
                                    modified_since = nil, 
                                    offset = nil, 
                                    order_by = nil, 
                                    series_type = nil, 
                                    start_year = nil, 
                                    title = nil, 
                                    title_starts_with = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories/{storyId}/series'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'storyId' => story_id
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'characters' => characters,
        'comics' => comics,
        'contains' => contains,
        'creators' => creators,
        'events' => events,
        'limit' => limit,
        'modifiedSince' => modified_since,
        'offset' => offset,
        'orderBy' => order_by,
        'seriesType' => series_type,
        'startYear' => start_year,
        'title' => title,
        'titleStartsWith' => title_starts_with,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          SeriesDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end

    # Fetches lists of stories.
    # @param [String] characters Optional parameter: Return only stories which feature the specified characters (accepts a comma-separated list of ids).
    # @param [String] comics Optional parameter: Return only stories contained in the specified (accepts a comma-separated list of ids).
    # @param [String] creators Optional parameter: Return only stories which feature work by the specified creators (accepts a comma-separated list of ids).
    # @param [String] events Optional parameter: Return only stories which take place during the specified events (accepts a comma-separated list of ids).
    # @param [String] limit Optional parameter: Limit the result set to the specified number of resources.
    # @param [String] modified_since Optional parameter: Return only stories which have been modified since the specified date.
    # @param [String] offset Optional parameter: Skip the specified number of resources in the result set.
    # @param [String] order_by Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "id", "modified", "-id", "-modified")
    # @param [String] series Optional parameter: Return only stories contained the specified series (accepts a comma-separated list of ids).
    # @return StoryDataWrapper response from the API call
    def get_story_collection(characters = nil, 
                             comics = nil, 
                             creators = nil, 
                             events = nil, 
                             limit = nil, 
                             modified_since = nil, 
                             offset = nil, 
                             order_by = nil, 
                             series = nil)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/stories'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'characters' => characters,
        'comics' => comics,
        'creators' => creators,
        'events' => events,
        'limit' => limit,
        'modifiedSince' => modified_since,
        'offset' => offset,
        'orderBy' => order_by,
        'series' => series,
        'apikey' => Configuration.apikey
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'referer' => Configuration.referer
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 409
        raise APIException.new 'Limit greater than 100.', 409, _response.body
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          StoryDataWrapper.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end
  end
end

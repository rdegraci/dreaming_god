module DreamingGod
  
  class Session
  
    def initialize session
      @session = session
      @db_session = "Db#{self.class.to_s.split(':').last}".constantize.where(:userId => session.userId).first
      
      if !@db_session 
        dbs = "Db#{self.class.to_s.split(':').last}".constantize.new
        dbs.sessionId = session.sessionId
        dbs.userId = session.userId
        dbs.save!
        @db_session = dbs
        @new_flag = true
      else
        @new_flag = false
      end
    end
    
    def imagine request
      @request = request
      case @request.type
      when 'LaunchRequest'
        # Prepare system
        card = response_card 'Dreaming God'
        ssml_response(speak('Greetings user. Tell me a fact for example, Cat is an animal.'), card, false)
      when 'IntentRequest'
        @intent = Alexagram::Intent.new(@request)
        intent_name = @intent.name.underscore
        case intent_name
        when 'list_rows'
          table_name = @intent.slots['table']['value']  #people
          if !table_name
            result = "What is the name of the table that you want to list?"
            card = response_card result
            ssml_response(speak(result), card, false)
          else
            names = ""
            result = "Db#{(table_name.capitalize.singularize)}".constantize.all.limit(3)
            result.each do |r|
              names << "#{r.label},"
            end
            names = "#{table_name} is empty" if names.length == 0
            res = "Here is the list of #{table_name}, #{names}"
            card = response_card res
            ssml_response(speak(res), card, true)
          end
        when 'create_person'
          result = ""
          table_name = intent_name.split('_').last.pluralize
          name = @intent.slots['personname']['value']   #bob
          person = @intent.slots['person']['value']   #man
          if !name
            result = "What was the name of the #{person}"
          else
            dbp = "Db#{(table_name.capitalize.singularize)}".constantize.new
            dbp.label = name
            dbp.people_type = person
            dbp.save
            result = "Ok. #{name} is a #{person}"
          end
          card = response_card result
          ssml_response(speak("#{result}"), card, true)
        when 'create_place'
          result = ""
          table_name = intent_name.split('_').last.pluralize
          name = @intent.slots['placename']['value']   # bahamas
          place = @intent.slots['place']['value']   # park
          if !name
            result = "What was the name of the #{place}"
          else
            dbp = "Db#{(table_name.capitalize.singularize)}".constantize.new
            dbp.label = name
            dbp.place_type = place
            dbp.save
            result = "Ok. #{name} is a #{place}"
          end
          card = response_card result
          ssml_response(speak("#{result}"), card, true)
        when 'create_thing'
          result = ""
          table_name = intent_name.split('_').last.pluralize
          name = @intent.slots['thingname']['value']   # bananna
          thing = @intent.slots['thing']['value']   # vegetable
          if !name
            result = "What was the name of the #{thing}"
          else
            dbp = "Db#{(table_name.capitalize.singularize)}".constantize.new
            dbp.label = name
            dbp.thing_type = thing
            dbp.save
            result = "Ok. #{name} is a #{thing}"
          end
          card = response_card result
          ssml_response(speak("#{result}"), card, true)
        when 'select_row'
          column_a = @intent.slots['columna']['value'] #all
          case column_a
          when 'thing type'
            column_a = 'thing_type'
          when 'person type'
            column_a = 'person_type'
          when 'place type'
            column_a = 'place_type'
          else
            column_a = (column_a == 'all' ? '*' : "'#{column_a}'")
          end
          table_name = @intent.slots['table']['value']  #people
          column_b = @intent.slots['columnb']['value'] #name
          compare_value = @intent.slots['comparevalue']['value'] #bob
          sql_string = "SELECT #{column_a.capitalize} FROM db_#{table_name} WHERE #{column_b} = '#{compare_value}'"
          result = "Db#{(table_name.capitalize.singularize)}".constantize.find_by_sql(sql_string)
          names = ""
          result.each do |r|
            names << "#{r.send(column_b)}, "
          end
          names = "#{table_name} table is empty" if names.length == 0
          card = response_card 'Dreaming God'
          ssml_response(speak("I have found the following, #{names}"), card, true)
        when 'update_row'        
          table_name = @intent.slots['table']['value']  #people
          column_a = @intent.slots['columna']['value'] #label
          value_a = @intent.slots['valuea']['value'] #joe
          column_b = @intent.slots['columnb']['value'] #label
          compare_value = @intent.slots['comparevalue']['value'] #bob
          
          case column_a
          when 'thing type'
            column_a = 'thing_type'
          when 'person type'
            column_a = 'person_type'
          when 'place type'
            column_a = 'place_type'
          else
            column_a = (column_a == 'all' ? '*' : "'#{column_a}'")
          end
          
          sql_string = "UPDATE db_#{table_name} SET #{column_a} = '#{value_a}' WHERE #{column_b} = '#{compare_value}'"
          result = "Db#{(table_name.capitalize.singularize)}".constantize.find_by_sql(sql_string)
          res = "I have updated the database where #{column_b} is equal to #{compare_value}"
          card = response_card res
          ssml_response(speak(res), card, true)
        when 'destroy_row'
          table_name = @intent.slots['table']['value']  #people
          column = @intent.slots['column']['value'] #label
          compare_value = @intent.slots['comparevalue']['value'] #bob
          
          case column
          when 'thing type'
            column = 'thing_type'
          when 'person type'
            column = 'person_type'
          when 'place type'
            column = 'place_type'
          else
            column = (column == 'all' ? '*' : "'#{column}'")
          end
          
          sql_string = "DELETE FROM db_#{table_name} where #{column} = '#{compare_value}'"
          "Db#{(table_name.capitalize.singularize)}".constantize.find_by_sql(sql_string)
          res = "I have destroyed rows from the database where #{column} is equal to #{compare_value}"
          card = response_card res
          ssml_response(speak(res), card, true)
        else
        end

      when 'SessionEndedRequest'        
        DbSession.detroy(@db_session.id.to_i)
        result = "End of line"
        card = response_card result
        ssml_response(speak(result), card, true)
      else
        #
      end
    end
    
    
    def is_new?
      @new_flag
    end
    
    
    def ssml_response(text, card, end_session=true)
      r = {
        "version" => "1.0",
        "sessionAttributes" => { },
        "response" => {
          "outputSpeech" => {
            "type" => "SSML",
            "ssml" => text
          },
          "shouldEndSession" => end_session
        }
      }
      r["response"]["card"] = card if card
      r.as_json
    end

    def response_card text=nil
      {
        "type" => "Simple",
        "title" => "Minerva Database",
        "content" => "#{text ||= 'Hello World'}"
      }
    end

    # somesite.com/file.mp3
    def audio url
      "<audio src=\"https://#{url}\" />"
    end

    # => 3s
    def break length
      "<break time=\"#{length}\"/> "
    end

    def paragraph text
      "<p>#{text}</p>"
    end

    def sentence text
      "<s>#{text}</s>"
    end


    def speak text
      "<speak>#{text}</speak>"
    end
    
  end
  
end

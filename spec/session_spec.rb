require "spec_helper"

RSpec.describe DreamingGod::Session do

  before do
    @json = %{
      {
        "session": {
          "sessionId": "sessionId",
          "application": {
            "applicationId": "applicationId"
          },
          "attributes": {},
          "user": {
            "userId": "userId"
          },
          "new": true
        },
        "request": {
          "type": "IntentRequest",
           "requestId": "requestId",
          "locale": "en-US",
          "timestamp": "2017-03-18T01:51:21Z",
          "intent": {
            "name": "CreatePerson",
            "slots": {
              "person": {
                "name": "person",
                "value": "woman"
              },
              "personname": {
                "name": "personname",
                "value": "Amy"
              }
            }
          }
        },
        "version": "1.0"
      }
    }
  end
  
  
  describe "session management" do
    

    it "can be initialized with an Alexagram session" do
      Alexagram.raw_json = @json
      session = DreamingGod::Session.new(Alexagram.session)
      expect(session).not_to be nil
    end
  
    it "can imagine an Alexagram request" do
      Alexagram.raw_json = @json
      session = DreamingGod::Session.new(Alexagram.session)
      session.imagine(Alexagram.request)
      expect(session).not_to be nil
    end
    
    it "can create a new session if the sessionid is new" do
      Alexagram.raw_json = @json

      session = DreamingGod::Session.new(Alexagram.session)
      expect(session.is_new?).to eq(true)
    end
    
    it "can use an existing session if the sessionid is not new" do
      Alexagram.raw_json = @json
      session1 = DreamingGod::Session.new(Alexagram.session)
      session2 = DreamingGod::Session.new(Alexagram.session)
      expect(session2.is_new?).to eq(false)

    end
    
  end


  describe "imagination" do
    before do
      
      Alexagram.raw_json = @json
      Alexagram.session
      @session = DreamingGod::Session.new(Alexagram.session)
    end

    it "can imagine a reality" do
      @session.imagine(Alexagram.request)
    end
    
    it "can remember a reality that it imagined" do
      
      result = @session.imagine(Alexagram.request)
      expect(result).not_to eq(nil)
    end
    
  end
  
  
  describe "LaunchRequest" do
    
    before do
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "LaunchRequest",
             "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-18T01:51:21Z",
            "intent": {
              "name": "CreatePerson",
              "slots": {
                "person": {
                  "name": "person",
                  "value": "woman"
                },
                "personname": {
                  "name": "personname",
                  "value": "Amy"
                }
              }
            }
          },
          "version": "1.0"
        }
      }
      Alexagram.raw_json = @json
      Alexagram.session
      @session = DreamingGod::Session.new(Alexagram.session)
    end
    
    it "will reply with Hello" do
      result = @session.imagine(Alexagram.request)
      expect(result).not_to eq(nil)
    end
    
  end
  
  
  
  describe "IntentRequest" do
        
    it "will handle ListRows" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
             "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-18T01:51:21Z",
            "intent": {
              "name": "ListRows",
              "slots": {
                "table": {
                  "name": "table",
                  "value": "people"
                }
              }
            }
          },
          "version": "1.0"
        }
      }
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    
    it "will handle CreatePerson" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
             "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-18T01:51:21Z",
            "intent": {
              "name": "CreatePerson",
              "slots": {
                "person": {
                  "name": "person",
                  "value": "man"
                },
                "personname": {
                  "name": "personname",
                  "value": "bob"
                }
              }
            }
          },
          "version": "1.0"
        }
      }
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    
    it "will handle CreatePlace" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
             "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-18T01:51:21Z",
            "intent": {
              "name": "CreatePlace",
              "slots": {
                "place": {
                  "name": "place",
                  "value": "country"
                },
                "placename": {
                  "name": "placename",
                  "value": "bahamas"
                }
              }
            }
          },
          "version": "1.0"
        }
      }
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    it "will handle CreateThing" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
             "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-18T01:51:21Z",
            "intent": {
              "name": "CreateThing",
              "slots": {
                "thing": {
                  "name": "thing",
                  "value": "vegetable"
                },
                "thingname": {
                  "name": "thingname",
                  "value": "bananna"
                }
              }
            }
          },
          "version": "1.0"
        }
      }
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    it "will handle SelectRow" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
            "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-24T19:27:09Z",
            "intent": {
              "name": "SelectRow",
              "slots": {
                "columna": {
                  "name": "columna",
                  "value": "all"
                },
                "columnb": {
                  "name": "columnb",
                  "value": "label"
                },
                "comparevalue": {
                  "name": "comparevalue",
                  "value": "bob"
                },
                "table": {
                  "name": "table",
                  "value": "people"
                }
              }
            }
          },
          "version": "1.0"
        }
      }

      person = DbPerson.new
      person.label = 'bob'
      person.people_type = 'man'
      person.save!
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    
    it "will handle UpdateRow" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
            "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-24T19:27:09Z",
            "intent": {
              "name": "UpdateRow",
              "slots": {
                "columna": {
                  "name": "columna",
                  "value": "label"
                },
                "columnb": {
                  "name": "columnb",
                  "value": "label"
                },
                "valuea": {
                  "name": "valuea",
                  "value": "joe"
                },
                "comparevalue": {
                  "name": "comparevalue",
                  "value": "bob"
                },
                "table": {
                  "name": "table",
                  "value": "people"
                }
              }
            }
          },
          "version": "1.0"
        }
      }

      
      
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
    
    
    
    it "will handle DestroyRow" do
      
      @json = %{
        {
          "session": {
            "sessionId": "sessionId",
            "application": {
              "applicationId": "applicationId"
            },
            "attributes": {},
            "user": {
              "userId": "userId"
            },
            "new": true
          },
          "request": {
            "type": "IntentRequest",
            "requestId": "requestId",
            "locale": "en-US",
            "timestamp": "2017-03-24T19:27:09Z",
            "intent": {
              "name": "DestroyRow",
              "slots": {
                "column": {
                  "name": "column",
                  "value": "label"
                },
                "comparevalue": {
                  "name": "comparevalue",
                  "value": "bob"
                },
                "table": {
                  "name": "table",
                  "value": "people"
                }
              }
            }
          },
          "version": "1.0"
        }
      }

      
      
      
      Alexagram.raw_json = @json
      @session = DreamingGod::Session.new(Alexagram.session)
      result = @session.imagine(Alexagram.request)
      puts "#{result}"
      expect(result).not_to eq(nil)
    end
  
  end
end
  


require "spec_helper"

RSpec.describe DreamingGod do
  it "has a version number" do
    expect(DreamingGod::VERSION).not_to be nil
  end


  it "takes json as a constructor argument" do
    json = "{}"
    DreamingGod.raw_json = json
    expect(DreamingGod.raw_json).not_to eq(nil)
  end
  
  it "will dream" do
    json = %{
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


    DreamingGod.raw_json = json
    DreamingGod.dream
  end
  

  
end

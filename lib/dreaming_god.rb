require "dreaming_god/version"
require "dreaming_god/session"
require 'alexagram'
require 'active_record'


module DreamingGod
  @raw_json
  
  def self.raw_json
    @raw_json
  end
  
  
  def self.raw_json= json
    @raw_json = json
  end
  
  def self.dream
    Alexagram.raw_json = @raw_json
    session = Alexagram.session
    
    @dream_session = DreamingGod::Session.new(session)
    @dream_session.imagine(Alexagram.request)
  end
  
  
end

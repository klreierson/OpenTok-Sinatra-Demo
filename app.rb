require 'rubygems'  
require 'sinatra'
require 'opentok'

API_KEY =  "32626492"	# Replace with your OpenTok API key.
API_SECRET = "0d7c7a0772e3db3e2ab2d4bab6d5e50d4ac355ef" 	# Replace with your OpenTok API secret.
OTSDK = OpenTok::OpenTokSDK.new API_KEY, API_SECRET

get '/' do
	sessionProperties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
	sessionId = OTSDK.createSession( sessionProperties )
	url = "/#{sessionId}"
	redirect url
end

get '/:session_id' do
	@sessionId = params[:session_id]
	@token = OTSDK.generateToken :session_id => @sessionId
	erb :chat
end
require 'rubygems'  
require 'sinatra'
require 'opentok'

API_KEY =  ""		# Replace with your OpenTok API key.
API_SECRET = "" 	# Replace with your OpenTok API secret.
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
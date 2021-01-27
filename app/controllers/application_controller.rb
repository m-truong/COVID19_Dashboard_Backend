class ApplicationController < ActionController::API
    def authenticate_token                                                        
        # puts "AUTHENTICATE JWT"         
        render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)                                            
    end 
    def bearer_token
        puts "BEARER TOKEN"
        puts header = request.env["HTTP_AUTHORIZATION"]
    end
    
    def decode_token(token_input)
        puts "DECODE TOKEN"
    end
end

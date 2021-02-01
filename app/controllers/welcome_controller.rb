class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "COVID-19 Dashboard RubyOnRails Backend" }
    end
end

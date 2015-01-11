class PostController < ApplicationController

load_and_authorize_resourse :only=> [:destroy]

end

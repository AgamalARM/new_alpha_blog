class PagesController < ApplicationController
    def home
    end
    
    def about
        @ml = `python3 lib/assets/python/hello.py`
    end
end

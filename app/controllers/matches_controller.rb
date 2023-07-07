class MatchesController < ApplicationController

     def create 
          match = Match.new_match(params)
          render json: match, status: :created
     end

     def update_last_read_at 
          match = Match.where
     end
end

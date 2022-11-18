class MainController < ApplicationController
    def index
        @personal_data = PersonalDatum.all
        @employments = Employment.all
    end
end

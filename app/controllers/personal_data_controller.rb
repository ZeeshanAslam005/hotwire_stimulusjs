class PersonalDataController < ApplicationController
  before_action :ensure_frame_response, only: [:new, :edit]

  def index
    @personal_data = PersonalDatum.all
  end

  def new
    @personal_datum = PersonalDatum.new
  end

  def create    
    @personal_datum = PersonalDatum.new(personal_datum_params)

    respond_to do |format|
      if @personal_datum.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('personal_info', partial: 'personal_data/personal_datum', locals: {personal_datum: @personal_datum}) }
        format.html { redirect_to personal_datum_url(@personal_datum), notice: "personal_data was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def personal_datum_params
      params.require(:personal_datum).permit(:first_name, :last_name, :nick_name, :email, :phone)
    end

    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end

class DataInputsController < ApplicationController
  before_action :set_data_input, only: [:show, :edit, :update, :destroy]

  # GET /data_inputs
  # GET /data_inputs.json
  def index
    @data_inputs = DataInput.all
  end

  # GET /data_inputs/1
  # GET /data_inputs/1.json
  def show
  end

  # GET /data_inputs/new
  def new
    @data_input = DataInput.new
  end

  # GET /data_inputs/1/edit
  def edit
  end

  # POST /data_inputs
  # POST /data_inputs.json
  def create
    @data_input = DataInput.new(data_input_params)#rest soap web services stateless http verbs status code separate the main app with the web services rspec unit testing tdd can can paper clip has_many belongs_to
     
    respond_to do |format|
      if @data_input.save
	  file = @data_input.tab.url
	  File.readlines("#{Rails.root}"+'/public' + file ).drop(1).map do |line|
		  purchaser_name,item_description,item_price,purchase_count,merchant_address,merchant_name  = line.split("\t") 
		  purchase = PurchaseDetail.new
		  purchase.purchaser_name = purchaser_name
		  purchase.item_description = item_description
		  purchase.item_price = item_price
		  purchase.purchase_count = purchase_count
		  purchase.merchant_address = merchant_address
		  purchase.merchant_name = merchant_name
		  purchase.save  
	end
        format.html { redirect_to :controller=>"purchase_details" }
        format.json { render :show, status: :created, location: @data_input }
      else
        format.html { render :new }
        format.json { render json: @data_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_inputs/1
  # PATCH/PUT /data_inputs/1.json
  def update
    respond_to do |format|
      if @data_input.update(data_input_params)
        format.html { redirect_to @data_input, notice: 'Data input was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_input }
      else
        format.html { render :edit }
        format.json { render json: @data_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_inputs/1
  # DELETE /data_inputs/1.json
  def destroy
    @data_input.destroy
    respond_to do |format|
      format.html { redirect_to data_inputs_url, notice: 'Data input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_input
      @data_input = DataInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_input_params
      params.require(:data_input).permit(:name,:tab)
    end
end

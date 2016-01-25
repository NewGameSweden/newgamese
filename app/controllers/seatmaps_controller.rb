class SeatmapsController < ApplicationController
  before_action :set_seatmap, only: [:show, :edit, :update, :destroy]

  # GET /seatmaps
  # GET /seatmaps.json
  def index
    @seatmaps = Seatmap.all
  end

  # GET /seatmaps/1
  # GET /seatmaps/1.json
  def show
    @seatmap = Seatmap.find(params[:id])
  end

  # GET /seatmaps/new
  def new
    @seatmap = Seatmap.new
    @rows = @seatmap.rows.build
    @seats = @rows.seats.build
  end

  # GET /seatmaps/1/edit
  def edit
    @seatmap = Seatmap.find(params[:id])
  end

  # POST /seatmaps
  # POST /seatmaps.json
  def create
    # modifies parameters to create the number of seats specified
    rows = params[:seatmap][:rows_attributes]
    for i in 0..rows.length-1
      number = params[:seatmap][:rows_attributes][i.to_s][:seats_attributes]["0"][:number]
      state = params[:seatmap][:rows_attributes][i.to_s][:seats_attributes]["0"][:state]
      for j in 0..number.to_i-1
        params[:seatmap][:rows_attributes][i.to_s][:seats_attributes][j.to_s] = {:number => j, :state => state.to_s}
      end
    end
    @seatmap = Seatmap.create(seatmap_params)

    respond_to do |format|
      if @seatmap.save
        format.html { redirect_to @seatmap, notice: 'Seatmap was successfully created.' }
        format.json { render :show, status: :created, location: @seatmap }
      else
        format.html { render :new }
        format.json { render json: @seatmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seatmaps/1
  # PATCH/PUT /seatmaps/1.json
  # Should only be updated using ajax through json
  def update
    @seatmap = Seatmap.find(params[:id])
    rows = params[:seatmap][:rows_attributes]
    for i in 0..rows.length.to_i-1
      seats = params[:seatmap][:rows_attributes][i][:seats_attributes]
      row = @seatmap.rows.where(name: rows[i][:name]).last
      for j in 0..seats.length-1
        number = rows[i][:seats_attributes][j][:number]
        state = rows[i][:seats_attributes][j][:state]
        seat = row.seats.where(number: number).last
        seat.state = state
        seat.save
      end
    end
    respond_to do |format|
      format.html { render :show}
    end
  end

  # DELETE /seatmaps/1
  # DELETE /seatmaps/1.json
  def destroy
    @seatmap.destroy
    respond_to do |format|
      format.html { redirect_to seatmaps_url, notice: 'Seatmap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_seatmap
      @seatmap = Seatmap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seatmap_params
      params.require(:seatmap).permit(:name, :_destroy, rows_attributes: [:id, :name, :x_coord, :y_coord, :_destroy, seats_attributes: [:id, :number, :state, :_destroy]])
    end
end

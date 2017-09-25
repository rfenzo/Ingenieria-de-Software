class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :is_admin_or_creator?, only: [:edit,:update,:destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
    @all_members = Artist.all
    @artist_member = @artist.artistmembers.build
  end

  # GET /artists/1/edit
  def edit
    @all_members = Artist.all
    @artist_member = @artist.artistmembers.build
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = current_user.artists.new(artist_params)

    params[:members][:id].each do |member|
     if !member.empty?
       @artist.artistmembers.build(:member_id => member)
     end
    end

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'El artista ha sido creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'El artista ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'El artista ha sido removido satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:Nombre, :Descripcion, :Genero, :Origen, :Actividad, :Integrantes)
    end

    def is_admin_or_creator?
      if not current_user.admin?
        if current_user != Artist.find(params[:id]).user
          redirect_to artists_url, notice: 'No tienes permiso para alterar el contenido de otra persona'
        end
      end
    end
end

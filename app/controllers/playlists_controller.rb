class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    @all_songs = Song.all
    @playlist_song = @playlist.playlistsongs.build
  end

  # GET /playlists/1/edit
  def edit
    @all_songs = Song.all
    @playlist_song = @playlist.playlistsongs.build
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = @user.playlists.new(playlist_params)
    @playlist.user = @user

    params[:songs][:id].each do |song|
      if !song.empty?
        @playlist.playlistsongs.build(:song_id => song)
      end
    end

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to user_playlists_path, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: user_playlists_path }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to user_playlists_path, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: user_playlists_path }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to user_playlists_path, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:Nombre, :Descripcion, :Duracion, :Calificacion, :user_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end

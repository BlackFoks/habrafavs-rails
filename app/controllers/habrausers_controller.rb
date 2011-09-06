# encoding: UTF-8

class HabrausersController < ApplicationController
  before_filter :authenticate_user!

  # GET /habrausers
  # GET /habrausers.json
  def index
    @habrausers = Habrauser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @habrausers }
    end
  end

  # GET /habrausers/1
  # GET /habrausers/1.json
  def show
    @habrauser = Habrauser.find(params[:id])

    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @habrauser }
    end
  end

  # GET /habrausers/new
  # GET /habrausers/new.json
  def new
    @habrauser = Habrauser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @habrauser }
    end
  end

  # GET /habrausers/1/edit
  def edit
    @habrauser = Habrauser.find(params[:id])
  end

  # POST /habrausers
  # POST /habrausers.json
  def create
    @habrauser = Habrauser.new
    @habrauser.user = current_user
    @habrauser.name = params[:habrauser][:name]
    @habrauser.slug = @habrauser.name_to_slug

    respond_to do |format|
      if @habrauser.save
        format.html { redirect_to current_user,
          notice: "Хабраюзер '#{@habrauser.name}' успешно привязан к вашему аккаунту." }
        format.json { render json: @habrauser, status: :created, location: @habrauser }
      else
        format.html { render action: "new" }
        format.json { render json: @habrauser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /habrausers/1
  # PUT /habrausers/1.json
  def update
    @habrauser = Habrauser.find(params[:id])

    respond_to do |format|
      if @habrauser.update_attributes(params[:habrauser])
        format.html { redirect_to @habrauser, notice: 'Habrauser was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @habrauser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habrausers/1
  # DELETE /habrausers/1.json
  def destroy
    @habrauser = Habrauser.find(params[:id])
    @habrauser.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :ok }
    end
  end
end

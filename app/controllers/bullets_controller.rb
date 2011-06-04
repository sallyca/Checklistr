class BulletsController < ApplicationController
  # GET /bullets
  # GET /bullets.xml
  def index
    @bullets = Bullet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bullets }
    end
  end

  # GET /bullets/1
  # GET /bullets/1.xml
  def show
    @bullet = Bullet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bullet }
    end
  end

  # GET /bullets/new
  # GET /bullets/new.xml
  def new
    @bullet = Bullet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bullet }
    end
  end

  # GET /bullets/1/edit
  def edit
    @bullet = Bullet.find(params[:id])
  end

  # POST /bullets
  # POST /bullets.xml
  def create
    @bullet = Bullet.new(params[:bullet])

    respond_to do |format|
      if @bullet.save
        format.html { redirect_to(@bullet, :notice => 'Bullet was successfully created.') }
        format.xml  { render :xml => @bullet, :status => :created, :location => @bullet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bullet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bullets/1
  # PUT /bullets/1.xml
  def update
    @bullet = Bullet.find(params[:id])

    respond_to do |format|
      if @bullet.update_attributes(params[:bullet])
        format.html { redirect_to(@bullet, :notice => 'Bullet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bullet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bullets/1
  # DELETE /bullets/1.xml
  def destroy
    @bullet = Bullet.find(params[:id])
    @bullet.destroy

    respond_to do |format|
      format.html { redirect_to(bullets_url) }
      format.xml  { head :ok }
    end
  end



end

class ListersController < ApplicationController
  # GET /listers
  # GET /listers.xml
  def index
    @listers = Lister.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listers }
    end
  end

  # GET /listers/1
  # GET /listers/1.xml
  def show
    @lister = Lister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lister }
    end
  end

  # GET /listers/new
  # GET /listers/new.xml
  def new
    @lister = Lister.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lister }
    end
  end

  # GET /listers/1/edit
  def edit
    @lister = Lister.find(params[:id])
  end

  # POST /listers
  # POST /listers.xml
  def create
    @lister = Lister.new(params[:lister])

    respond_to do |format|
      if @lister.save
        format.html { redirect_to(@lister, :notice => 'Lister was successfully created.') }
        format.xml  { render :xml => @lister, :status => :created, :location => @lister }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lister.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listers/1
  # PUT /listers/1.xml
  def update
    @lister = Lister.find(params[:id])

    respond_to do |format|
      if @lister.update_attributes(params[:lister])
        format.html { redirect_to(@lister, :notice => 'Lister was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lister.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listers/1
  # DELETE /listers/1.xml
  def destroy
    @lister = Lister.find(params[:id])
    @lister.destroy

    respond_to do |format|
      format.html { redirect_to(listers_url) }
      format.xml  { head :ok }
    end
  end
end

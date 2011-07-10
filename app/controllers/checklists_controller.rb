class ChecklistsController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  # GET /checklists
  # GET /checklists.xml
  def index
    @checklists = Checklist.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @checklists }
    end
  end
  
  # GET /checklists
  # GET /checklists.xml
  def main
    @checklists = Checklist.where(:shared => true)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @checklists }
    end
  end

  # GET /checklists/1
  # GET /checklists/1.xml
  def show
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @checklist }
    end
  end

  # GET /checklists/new
  # GET /checklists/new.xml
  def new
    @checklist = Checklist.new
    if params[:page_id].nil?
      params[:page_id]=Page.first.id
    end
    page=Page.find(params[:page_id])
    page.checklists<<@checklist

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @checklist }
    end
  end

  # GET /checklists/1/edit
  def edit
    @checklist = Checklist.find(params[:id])
  end

  # POST /checklists
  # POST /checklists.xml
  def create
    @checklist = Checklist.new(params[:checklist])

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to(@checklist, :notice => 'Checklist was successfully created.') }
        format.xml  { render :xml => @checklist, :status => :created, :location => @checklist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @checklist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /checklists/1
  # PUT /checklists/1.xml
  def update
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      if @checklist.update_attributes(params[:checklist])
        format.html { redirect_to(@checklist, :notice => 'Checklist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @checklist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.xml
  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy

    respond_to do |format|
      format.html { redirect_to(checklists_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sort_column
    Checklist.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end

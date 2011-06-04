
class PagesController < ApplicationController

  can_edit_on_the_spot
#
#   in_place_edit_for :page, :title

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    @select_list=@page.select_list.keys
    respond_to do |format|
      format.html # show.html.erb

      format.xml { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @page.checklists= Array.new
    checklist= Checklist.new
    checklist.title='Новый список'
    @page.checklists<<checklist


    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.js
        format.xml { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])
     respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml { head :ok }
    end
  end


  # GET /pages/new
  # GET /pages/new.xml
  def addbullet

    if !params[:search].nil?
      @selected =params[:search]['title']
      checklist=nil
      @page=Page.find(params[:page_id])
      @page.checklists.each do |list|
        if @selected==list.title
          checklist=list
        end
      end
      if checklist.nil?
        checklist=@page.checklists[1]
      end

      bullet=Bullet.new
      bullet.text=params[:page]['new_bullet']
      bullet.ready=false
      checklist.bullets<<bullet

    end
    respond_to do |format|
      format.html { redirect_to(@page, :notice => 'Bullet was successfully created.') }
      format.xml { render :xml => @page }
    end
  end

  def ready
    if !params[:bullet_id].nil?
      @bullet = Bullet.find(params[:bullet_id])
      @bullet.ready == false ? @bullet.ready=true : @bullet.ready=false
      @bullet.save


      @bullets=Bullet.all
#      @checklist=Checklist.find(@bullet.checklist_id)
#      @checklist.bullets=@bullets
#      @checklists=Checklist.all
#      @page=Page.find(@checklist.page_id)
#      @page.checklists=@checklists
#      @page.save
    end
    render :nothing => true

  end

end

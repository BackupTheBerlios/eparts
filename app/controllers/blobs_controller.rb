class BlobsController < ApplicationController
  # GET /blobs
  # GET /blobs.xml
  def index
    @search = Blob.search( params[:search] )
    if( !params[:search] )
      @search = @search.order( "ascend_by_id" )
    end
    @blobs = @search.paginate( :page => params[:page], :per_page => 10 )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blobs }
    end
  end

  # GET /blobs/1
  # GET /blobs/1.xml
  def show
    @blob = Blob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blob }
    end
  end

  # GET /blobs/new
  # GET /blobs/new.xml
  def new
    @blob = Blob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blob }
    end
  end

  # GET /blobs/1/edit
  def edit
    @blob = Blob.find( params[:id] )
  end

  # POST /blobs
  # POST /blobs.xml
  def create
    @blob = Blob.new( params[:blob] )

    respond_to do |format|
      if @blob.save
        flash[:notice] = 'Blob was successfully created.'
        format.html { redirect_to( edit_blob_url(@blob) ) }
        format.xml  { render :xml => @blob, :status => :created, :location => @blob }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blob.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blobs/1
  # PUT /blobs/1.xml
  def update
    @blob = Blob.find( params[:id] )

    respond_to do |format|
      if @blob.update_attributes(params[:blob])
        flash[:notice] = 'Blob was successfully updated.'
        format.html { redirect_to(blobs_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blob.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blobs/1
  # DELETE /blobs/1.xml
  def destroy
    @blob = Blob.find(params[:id])
    @blob.destroy

    respond_to do |format|
      format.html { redirect_to(blobs_url) }
      format.xml  { head :ok }
    end
  end
end

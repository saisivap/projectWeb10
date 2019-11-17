class QuotationController < ApplicationController
  def quotation
    # @quotations=Quotation.all
    # @category=Quotation.pluck(:category).uniq
    #debugger
    # @quotation=Quotation.where(["quote LIKE ?","%#{params[:search]}%"])
    # @quotation=Quotation.search(params[:search])
    if params[:quotation]
      @quotation = Quotation.new( quotation_params )
      # debugger
      if params[:quotation][:category2]==""
        @quotation.category=params[:quotation][:category]
      else
        @quotation.category=params[:quotation][:category2]
      end
      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
      end
    else
      @quotation = Quotation.new
    end
    if params[:sort_by] == "date"
      @quotations = Quotation.order(:created_at)
    else
      @quotations = Quotation.order(:category)
    end
  end

  def index
    @quotation=Quotation.search(params[:search].downcase)
  end
  def export
    @quotationS=Quotation.all
    # debugger
    # respond_to do |format|
    #   format.xml{render xml: @quotation}
    # end
    # render :xml=>@quotation.to_xml
    # debugger
    render xml: @quotationS
  end
  # def export
  #   @quotation = Quotation.all
  #   respond_to do |format|
  #     # format.html
  #     # # format.js
  #     format.xml { render xml: @quotation }
  #   end
  # end
def uploadFile
  # debugger
  filename =
  xml = File.open("myfile.xml")
  data = Hash.from_xml(xml)
    debugger
end
  def sql
    c=Rails.root.join 'public/basic.txt'
    str=c.to_s
    # debugger
    @file=File.read(str)

  end
  def sql1
    c=Rails.root.join 'public/sample-data.txt'
    str=c.to_s
    # debugger
    @file=File.read(str)

  end
  def Document

  end
  def ps2

    end
  def ps4

  end

  private
  def quotation_params
    params.require(:quotation).permit(:author_name,:category, :quote)
  end
end
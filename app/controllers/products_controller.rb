class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def area_chart    
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows( [
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
      ])
    options = Hash.new
    options['width'] = 1024
    options['height'] = 480
    options['title'] = 'Demo Area Chart'
    # opts   = { width => 400, height => 240, title => 'Company Performance', 
    #            hAxis => {title => 'Year', titleTextStyle => {color => '#FF0000'}} }
    @chart = GoogleVisualr::Interactive::AreaChart.new(data_table,options)   
  end
  
  def pie_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Task')
    data_table.new_column('number', 'Hours per Day')
    data_table.add_rows(5)
    data_table.set_cell(0, 0, 'Work'     )
    data_table.set_cell(0, 1, 11 )
    data_table.set_cell(1, 0, 'Eat'      )
    data_table.set_cell(1, 1, 2  )
    data_table.set_cell(2, 0, 'Commute'  )
    data_table.set_cell(2, 1, 2  )
    data_table.set_cell(3, 0, 'Watch TV' )
    data_table.set_cell(3, 1, 2  )
    data_table.set_cell(4, 0, 'Sleep'    )
    data_table.set_cell(4, 1, 7  )

    options = Hash.new
    options['width'] = 1024
    options['height'] = 480
    options['title'] = 'Demo Pie Chart'
    #opts   = { :width => 400, :height => 240, :title => 'My Daily Activities', :is3D => true }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, options)

  end
  
  def bar_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 660)
    data_table.set_cell(2, 2, 1120)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    options = Hash.new
    options['width'] = 1024
    options['height'] = 480
    options['title'] = 'Demo Bar Chart'
    #opts   = { :width => 400, :height => 240, :title => 'Company Performance', vAxis: {title: 'Year', titleTextStyle: {color: 'red'}} }
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, options)

  end

  def candlestick_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'day')
    data_table.new_column('number', 'min')
    data_table.new_column('number', 'opening')
    data_table.new_column('number', 'closing')
    data_table.new_column('number', 'max')
    data_table.add_rows( [
        ['Mon',20,28,38,45],
        ['Tue',31,38,55,66],
        ['Wed',50,55,77,80],
        ['Thu',50,77,66,77],
        ['Fri',15,66,22,68]
      ] )

    opts   = { :width => 1024, :height => 480, :legend => 'none', :title => 'Demo Candle Stick Chart' }
    @chart = GoogleVisualr::Interactive::CandlestickChart.new(data_table, opts)

  end
  
  def annotated_time_line
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('date'  , 'Date')
    data_table.new_column('number', 'Sold Pencils')
    data_table.new_column('string', 'title1')
    data_table.new_column('string', 'text1' )
    data_table.new_column('number', 'Sold Pens'   )
    data_table.new_column('string', 'title2')
    data_table.new_column('string', 'text2' )
    data_table.add_rows( [
        [ Date.parse("2008-2-1"), 30000, '', '', 40645, '', ''],
        [ Date.parse("2008-2-2"), 14045, '', '', 20374, '', ''],
        [ Date.parse("2008-2-3"), 55022, '', '', 50766, '', ''],
        [ Date.parse("2008-2-4"), 75284, '', '', 14334, 'Out of Stock','Ran out of stock on pens at 4pm'],
        [ Date.parse("2008-2-5"), 41476, 'Bought Pens','Bought 200k pens', 66467, '', ''],
        [ Date.parse("2008-2-6"), 33322, '', '', 39463, '', '']
      ] )

    #opts   = { :displayAnnotations => true }
    @chart = GoogleVisualr::Interactive::AnnotatedTimeLine.new(data_table)

  end
  
  def column_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 660)
    data_table.set_cell(2, 2, 1120)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    opts   = { :width => 1024, :height => 480, :title => 'Company Performance', :hAxis => { :title => 'Year', :titleTextStyle => {:color => 'red'}} }
    @chart = GoogleVisualr::Interactive::ColumnChart.new(data_table, opts)

  end
  
  def combo_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'month'       )
    data_table.new_column('number', 'Bolivia'     )
    data_table.new_column('number', 'Ecuador'     )
    data_table.new_column('number', 'Madagascar'  )
    data_table.new_column('number', 'Papua Guinea')
    data_table.new_column('number', 'Rwanda'      )
    data_table.new_column('number', 'Avarage'     )
    data_table.add_rows( [
        ['2004/05', 165, 938  , 522, 998  , 450, 614.6],
        ['2005/06', 135, 1120 , 599, 1268 , 288, 682  ],
        ['2006/07', 157, 1167 , 587, 807  , 397, 623  ],
        ['2007/08', 139, 1110 , 615, 968  , 215, 609.4],
        ['2008/09', 136, 691  , 629, 1026 , 366, 569.6]
      ] )

    opts   = { :width => 1024, :height => 480, :title => 'Monthly Coffee Production by Country', :vAxis => {:title => 'Cups'}, :hAxis => {:title => 'Month'}, :seriesType => 'bars', :series => {'5' => {:type => 'line'}} }
    @chart = GoogleVisualr::Interactive::ComboChart.new(data_table, opts)

  end
  
  def gauge
    
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Label')
    data_table.new_column('number'  , 'Value')
    data_table.add_rows(3)
    data_table.set_cell(0, 0, 'Memory' )
    data_table.set_cell(0, 1, 80)
    data_table.set_cell(1, 0, 'CPU'    )
    data_table.set_cell(1, 1, 55)
    data_table.set_cell(2, 0, 'Network')
    data_table.set_cell(2, 1, 68)
    
    opts   = { :width => 1024, :height => 480, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
    @chart = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
    
  end
  
  def line_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 860)
    data_table.set_cell(2, 2, 580)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    opts   = { :width => 1024, :height => 480, :title => 'Demo Line Chart', :legend => 'bottom' }
    @chart = GoogleVisualr::Interactive::LineChart.new(data_table, opts)

  end
  
  def scatter_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'Age')
    data_table.new_column('number', 'Weight')
    data_table.add_rows(6)
    data_table.set_cell( 0, 0, 8  )
    data_table.set_cell( 0, 1, 12 )
    data_table.set_cell( 1, 0, 4  )
    data_table.set_cell( 1, 1, 5.5)
    data_table.set_cell( 2, 0, 11 )
    data_table.set_cell( 2, 1, 14 )
    data_table.set_cell( 3, 0, 4  )
    data_table.set_cell( 3, 1, 4.5)
    data_table.set_cell( 4, 0, 3  )
    data_table.set_cell( 4, 1, 3.5)
    data_table.set_cell( 5, 0, 6.5)
    data_table.set_cell( 5, 1, 7  )

    opts   = { :width => 1024, :height => 480, :title => 'Age vs. Weight comparison',
      :hAxis => { :title => 'Age'    , :minValue => 0, :maxValue => 15 },
      :vAxis => { :title => 'Weight' , :minValue => 0, :maxValue => 15 },
      :legend => 'none' }
    @chart = GoogleVisualr::Interactive::ScatterChart.new(data_table, opts)

  end
  
  def table

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Name')
    data_table.new_column('number'  , 'Salary')
    data_table.new_column('boolean' , 'Full Time Employee')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, 'Mike'  )
    data_table.set_cell(0, 1, {:v => 10000, :f => '$10,000'})
    data_table.set_cell(0, 2, true  )
    data_table.set_cell(1, 0, 'Jim'   )
    data_table.set_cell(1, 1, {:v => 8000 , :f => '$8,000' })
    data_table.set_cell(1, 2, false )
    data_table.set_cell(2, 0, 'Alice' )
    data_table.set_cell(2, 1, {:v => 12500, :f => '$12,500'})
    data_table.set_cell(2, 2, true  )
    data_table.set_cell(3, 0, 'Bob'   )
    data_table.set_cell(3, 1, {:v => 7000 , :f => '$7,000' })
    data_table.set_cell(3, 2, true  )

    opts   = { :width => 600, :showRowNumber => true }
    @chart = GoogleVisualr::Interactive::Table.new(data_table, opts)

  end
  
end

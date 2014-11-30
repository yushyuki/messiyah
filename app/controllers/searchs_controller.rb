class SearchsController < ApplicationController
  def index
  	@posts=Post.all
  	rent = params[:rent]
  	kind = params[:kind]
  	time = params[:time]
  	all  = params[:all]
  	kitchen = params[:kitchen]
  	hall = params[:hall]
  	counter = params[:counter]
  	fryer  = params[:fryer]
  	gas_stove = params[:gas_stove]
  	range = params[:range]
  	refrigerator = params[:refrigerator]
  	dishwashers  = params[:dishwashers]
  	worktop = params[:worktop]
  	sink  = params[:sink]

  	if !rent.nil?
       rent = rent.first
  		if(rent.to_i == 1)
	  	  @posts.where!(['house_rent >=0 and house_rent<=50000'])
	  	elsif(rent.to_i == 2)
	  	  @posts.where!(['house_rent >=50000 and house_rent<=100000'])
	    elsif(rent.to_i == 3)
	  	  @posts.where!(['house_rent >=100000 and house_rent<=150000'])
	  	elsif(rent.to_i == 4)
	  	  @posts.where!(['house_rent >=150000 and house_rent<=200000'])
	    elsif(rent.to_i == 5)
	  	  @posts.where!(['house_rent >=200000 and house_rent<=250000'])
	  	end
  	end

    if !kind.nil?
    	kind = kind.first
        if(kind.to_i == 1)
          @posts.where!('shop_kind == 1')
        elsif(kind.to_i == 2)
          @posts.where!('shop_kind == 2')
        elsif(kind.to_i == 3)
          @posts.where!('shop_kind == 3')
        elsif(kind.to_i == 4)
          @posts.where!('shop_kind == 4')
        elsif(kind.to_i == 5)
          @posts.where!('shop_kind == 5')
        elsif(kind.to_i == 6)
          @posts.where!('shop_kind == 6')
        elsif(kind.to_i == 7)
          @posts.where!('shop_kind == 7')
        elsif(kind.to_i == 8)
          @posts.where!('shop_kind == 8')
        elsif(kind.to_i == 9)
          @posts.where!('shop_kind == 9')
        elsif(kind.to_i == 10)
          @posts.where!('shop_kind == 10')
        elsif(kind.to_i == 11)
          @posts.where!('shop_kind == 11')
        elsif(kind.to_i == 12)
          @posts.where!('shop_kind == 12')
        elsif(kind.to_i == 13)
          @posts.where!('shop_kind == 13')
        elsif(kind.to_i == 14)
          @posts.where!('shop_kind == 14')
        end
    end

    if !time.nil?
       time = time.first
  		if(time.to_i == 1)
	  	  @posts.where!(['time >=0 and time2<=12'])
  		elsif(time.to_i == 2)
	  	  @posts.where!(['time >=9 and time2<=15'])
  		elsif(time.to_i == 3)
	  	  @posts.where!(['time >=15 and time2<=22'])
  		elsif(time.to_i == 4)
	  	  @posts.where!(['time2 >=22 and time1<=5'])
	  	end
  	end

    all = all.second
    if(all.to_i == 1)
    	# @posts.where!('all == 1')
    end
    kitchen = kitchen.second
    if(kitchen.to_i == 1)
    	@posts.where!('kitchen == 1')
    end
    hall = hall.second
    if(hall.to_i == 1)
    	@posts.where!('hall == 1')
    end
    counter = counter.second
    if(counter.to_i == 1)
    	@posts.where!('counter == 1')
    end
    fryer = fryer.second
    if(fryer.to_i == 1)
    	@posts.where!('fryer == 1')
    end
    gas_stove = gas_stove.second
    if(gas_stove.to_i == 1)
    	@posts.where!('gas_stove == 1')
    end
    refrigerator = refrigerator.second
    if(refrigerator.to_i == 1)
    	@posts.where!('refrigerator == 1')
    end
    dishwashers = dishwashers.second
    if(dishwashers.to_i == 1)
    	@posts.where!('dishwashers == 1')
    end
    sink = sink.second
    if(sink.to_i == 1)
    	@posts.where!('sink == 1')
    end
    worktop = worktop.second
    if(worktop.to_i == 1)
    	@posts.where!('worktop == 1')
    end
  end
end



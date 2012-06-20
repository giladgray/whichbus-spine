class StopsController < ApplicationController
	def index
		# split stops into groups of 100, served up using page parameter
		@stops = Stop.order("name").limit(100).offset(params.has_key?('page') ? params[:page].to_i * 100 : 0)

		respond_to do |format|
			format.html
			format.json { render :json => @stops }
			format.xml  { render :xml => @stops }
		end
	end

	def create
		puts "create called. #{params[:name]}"
	end

	def show
		@stop = Stop.find_by_oba_id(params[:id])

		respond_to do |format|
			format.html
			format.json { render :json => @stop }
			format.xml  { render :xml => @stop }
		end
	end

	def show_otp
		@stop = Stop.find_by_agency_code_and_code(params[:agency], params[:code])

		respond_to do |format|
			format.html { render 'show' }
			format.json { render :json => @stop }
			format.xml  { render :xml => @stop }
		end
	end

	def edit
		@stop = Stop.find(params[:id])
	end
end

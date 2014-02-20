class PostsController < ApplicationController
	def new
		@post = Post.new

	def sendMessage
		account_sid = "ACce2ac884ee78da5155fc87f7bbc0cb4a" 
		auth_token = "40f5a6b6a24f8cae7760b7151563a18a" 

		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+16087136449" # Your Twilio number
		friends = {
			"+18155203817" => "Emilia"
		}

		friends.each do |key, value|
			client.account.messages.create(
				:from => from,
				:to => key,
				:body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
			)
			puts "Sent message to #{value}"
		end
	
	end
	sendMessage
	end	



	def create
#		render text: params[:post].inspect
		@post = Post.new(params[:post])
		if @post.save
			redirect_to @post
		else 
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end	
end

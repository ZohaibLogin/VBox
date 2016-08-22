class HomeController < ApplicationController

	def index
		
		if !session[:phone_number]
			session[:phone_number] = ""
		end

		url = "http://46.234.109.113/home_lists/" 
		@home_lists = HTTParty.get(url)
		@home_lists.to_json

		session[:home_first_sec] = @home_lists[0]['data_url']
		session[:home_second_sec] = @home_lists[1]['data_url']
		session[:home_third_sec] = @home_lists[2]['data_url']
		
		if @home_lists[3]
			session[:home_fourth_sec] = @home_lists[3]['data_url']
		end
		if @home_lists[4]
			session[:home_fifth_sec] = @home_lists[4]['data_url'] 
		end
		if @home_lists[5]
			session[:home_sixth_sec] = @home_lists[5]['data_url'] 
		end
		if @home_lists[6]
			session[:home_seventh_sec] = @home_lists[6]['data_url'] 
		end
		if @home_lists[7]
			session[:home_eigth_sec] = @home_lists[7]['data_url'] 
		end
		if @home_lists[8]
			session[:home_ninth_sec] = @home_lists[8]['data_url'] 
		end
		if @home_lists[9]
			session[:home_tenth_sec] = @home_lists[9]['data_url']
		end
		if @home_lists[10]
			session[:home_eleventh_sec] = @home_lists[10]['data_url'] 
		end
		if @home_lists[11]
			session[:home_twelveth_sec] = @home_lists[11]['data_url']
		end
		if @home_lists[12]
			session[:home_thirteenth_sec] = @home_lists[12]['data_url']
		end
		if @home_lists[13]
			session[:home_fourteenth_sec] = @home_lists[13]['data_url']
		end
		if @home_lists[14]
			session[:home_fifteenth_sec] = @home_lists[14]['data_url']
		end

		if request.headers['X-PJAX']
    		render :layout => false
  		end

	end

	def vbox_app
	end

	def videos
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def trending
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def music_trends
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def mashups
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def bhangra
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def sufi
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def slow
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def romantic
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def party
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def sad
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def latest_music
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end
	def featured_artists
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def live_channels
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def most_viewed
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def comedy_time
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def bollywood
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def drama
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def movies
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def music

		if params[:id]  
			
			url = "http://46.234.109.113/song_albums/" + params[:id].to_s
			res = HTTParty.get(url)
			res.to_json

			@video_title = res['title']
			@video_preview = res['thumb_url_sm']
			@share_url = "http://vbox.mobi/music?id=" + res['id'].to_s

		end

		if params[:artist_id]
			
			url = "http://46.234.109.113/songs/artists/" + params[:artist_id].to_s
			res = HTTParty.get(url)
			res.to_json

			puts res

			@video_title = res['name']
			@video_preview = res['thumb_url_sm']
			@share_url = "http://vbox.mobi/music?artist_id=" + res['id'].to_s

		end

		if params[:song_id] 
			
			url = "http://46.234.109.113/songs/" + params[:song_id].to_s
			res = HTTParty.get(url)
			res.to_json

			@video_title = res['title']
			@video_preview = res['thumb_url_sm']
			@share_url = "http://vbox.mobi/music?song_id=" + res['id'].to_s

		end

		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def comedy
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def cooking
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def fashion
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def search
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def video

		videoId = params[:id]
	
		if session[:phone_number] != ""
    
          	phone_number = session[:phone_number]

	        if session[:telco] == 'non-mobilink'
	        	url = "http://46.234.109.113/telco/mobilink/check_user_status?phone=" + session[:phone_number]
	        	@status_response = HTTParty.get(url)
	        	@status_response.to_json
	        end

			url = "http://46.234.109.113/api/videos/" + videoId.to_s + "?phone_no=" + phone_number.to_s + "&telco=zain"

			@response = HTTParty.get(url)
			@response.to_json

			url = "http://46.234.109.113/api/get_video_secret_key?user_id=" + session[:user_id].to_s + "&video_id=" + videoId.to_s
			@secret_response = HTTParty.get(url)
			@secret_response.to_json

			if @response['qualities'][0] 
				@default_video_url = @response['qualities'][0]['url']
			end

			@video_preview = @response['thumb_url']
			@video_title = @response['title']
			@share_url = "http://vbox.mobi/video?id=" + @response['id'].to_s

			#@sd_video_url = @response['sd_video_url'] + "?user_id=" + session[:user_id].to_s + "&ssid=" + @secret_response['sd'].to_s
 			

		end

		if request.headers['X-PJAX']
    		render :layout => false
  		end

	end

	def edit_playlists 
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def playlists 
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def favorites 
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

	def song

		songId = params[:id]
		phoneNumber = "090078601"

		url = "http://46.234.109.113/songs/" + songId + "?phone=" + phoneNumber

		@response = HTTParty.get(url)
		@response.to_json

	end

	def album
		if request.headers['X-PJAX']
    		render :layout => false
  		end
	end

end

class AjaxController < ApplicationController

	def handler
    call = "#{request.method}:#{params[:call]}"
    
    begin
      case call
      
      when 'GET:home_section'
      	
        session_index = params[:sessionIndex]
        
        if session_index == '0'
          url = session[:home_first_sec]
        end
        if session_index == '1'
          url = session[:home_second_sec]
        end
        if session_index == '2'
          url = session[:home_third_sec]
        end
        if session_index == '3'
          url = session[:home_fourth_sec]
        end
        if session_index == '4'
          url = session[:home_fifth_sec]
        end
        if session_index == '5'
          url = session[:home_sixth_sec]
        end
        if session_index == '6'
          url = session[:home_seventh_sec]
        end
        if session_index == '7'
          url = session[:home_eigth_sec]
        end
        if session_index == '8'
          url = session[:home_ninth_sec]
        end
        if session_index == '9'
          url = session[:home_tenth_sec]
        end
        if session_index == '10'
          url = session[:home_eleventh_sec]
        end
        if session_index == '11'
          url = session[:home_twelveth_sec]
        end
        if session_index == '12'
          url = session[:home_thirteenth_sec]
        end
        if session_index == '13'
          url = session[:home_fourteenth_sec]
        end
        if session_index == '14'
          url = session[:home_fifteenth_sec]
        end

        url = url.to_s + "?telco=zain&limit=22&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
      	response.to_json

        combined_response = []
        combined_response[0] = response
        combined_response[1] = session_index


      	ajax_success("Home page section fetched", combined_response)

      when 'GET:get_language_regions'

        if session[:phone_number] != ''
          url = 'http://46.234.109.113/api/language_region/get?user_id=' + session[:user_id].to_s
          response = HTTParty.get(url)
          response.to_json
        else
          response = nil
        end
        ajax_success("Get language regions", response)

      when 'GET:set_language_region'
        puts "session->" + session[:phone_number].to_s + " Region id -> " + params[:region_id].to_s
        url = 'http://46.234.109.113/api/language_region/set?user_id=' + session[:user_id].to_s + '&region_id=' + params[:region_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Language region set", response)

      when 'GET:music_section'
        url = params[:url] 
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music page section fetched", response)

      when 'GET:moods_mashups'
        url = 'http://46.234.109.113/songs/moods/6?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_bhangra'
        url = 'http://46.234.109.113/songs/moods/8?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_sufi'
        url = 'http://46.234.109.113/songs/moods/7?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_sad'
        url = 'http://46.234.109.113/songs/moods/3?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_romantic'
        url = 'http://46.234.109.113/songs/moods/2?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_party'
        url = 'http://46.234.109.113/songs/moods/4?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:moods_slow'
        url = 'http://46.234.109.113/songs/moods/9?telco=zain&limit=30&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:latest_music'
        url = 'http://46.234.109.113/song_albums/get_latest_albums?limit=24&telco=zain&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:featured_artists'
        url = 'http://46.234.109.113/api/song_artists/get_featured_artists_list?limit=24&telco=zain&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Music mashups fetched", response)

      when 'GET:random_album'
        url = 'http://46.234.109.113/song_albums/get_random_album'
        response = HTTParty.get(url)
        response.to_json
  
        ajax_success("Random Album section fetched", response)

      when 'GET:trending_page'
        url = 'http://46.234.109.113/home_lists/8?page=1&limit=24'
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Trending data fetched", response)

      when 'GET:recently_viewed'
        url = "http://46.234.109.113/home_lists/16?page=1&limit=18"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:music_trends'
        url = 'http://46.234.109.113/home_lists/11?page=1&limit=24&user_id=' + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Music Trends data fetched", response)

      when 'GET:recently_played'
        url = "http://46.234.109.113/home_lists/17?page=1&limit=12"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Recently Played fetched", response)

      when 'GET:live_channels_page'
        url = "http://46.234.109.113/home_lists/13?page=1&limit=24"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Live channels page fetched", response)

      when 'GET:comedy_time_page'
        url = "http://46.234.109.113/home_lists/15?page=1&limit=24"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Comedy time page fetched", response)

      when 'GET:comedy_in_play'
        url = "http://46.234.109.113/home_lists/18?page=1&limit=18"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Comedy in play section fetched", response)

      when 'GET:most_viewed_page'
        url = "http://46.234.109.113/home_lists/14?page=1&limit=24"
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Most Viewed Videos page fetched", response)

      when 'GET:bollywood_latest'
        url = "http://46.234.109.113/api/categories/latest/1?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Bollywood Latest Videos page fetched", response)

      when 'GET:bollywood_featured'
        url = "http://46.234.109.113/api/categories/featured/1?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Bollywood Featured Videos page fetched", response)

      when 'GET:bollywood_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/1?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Bollywood Top Rated Videos page fetched", response)

      when 'GET:drama_latest'
        url = "http://46.234.109.113/api/categories/latest/2?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Drama Latest Videos page fetched", response)

      when 'GET:drama_featured'
        url = "http://46.234.109.113/api/categories/featured/2?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Drama Featured Videos page fetched", response)

      when 'GET:drama_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/2?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Drama Top Rated Videos page fetched", response)

      when 'GET:movies_latest'
        url = "http://46.234.109.113/api/categories/latest/9?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Movies Latest Videos page fetched", response)

      when 'GET:movies_featured'
        url = "http://46.234.109.113/api/categories/featured/9?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Movies Featured Videos page fetched", response)

      when 'GET:movies_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/9?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Movies Top Rated Videos page fetched", response)

      when 'GET:music_latest'
        url = "http://46.234.109.113/api/categories/latest/3?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Music Latest Videos page fetched", response)

      when 'GET:music_featured'
        url = "http://46.234.109.113/api/categories/featured/3?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Music Featured Videos page fetched", response)

      when 'GET:music_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/3?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Music Top Rated Videos page fetched", response)

      when 'GET:comedy_latest'
        url = "http://46.234.109.113/api/categories/latest/5?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Comedy Latest Videos page fetched", response)

      when 'GET:comedy_featured'
        url = "http://46.234.109.113/api/categories/featured/5?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Comedy Featured Videos page fetched", response)

      when 'GET:comedy_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/5?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Comedy Top Rated Videos page fetched", response)

      when 'GET:cooking_latest'
        url = "http://46.234.109.113/api/categories/latest/6?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Cooking Latest Videos page fetched", response)

      when 'GET:cooking_featured'
        url = "http://46.234.109.113/api/categories/featured/6?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Cooking Featured Videos page fetched", response)

      when 'GET:cooking_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/6?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Cooking Top Rated Videos page fetched", response)

      when 'GET:fashion_latest'
        url = "http://46.234.109.113/api/categories/latest/4?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Fashion Latest Videos page fetched", response)

      when 'GET:fashion_featured'
        url = "http://46.234.109.113/api/categories/featured/4?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Fashion Featured Videos page fetched", response)

      when 'GET:fashion_top_rated'
        url = "http://46.234.109.113/api/categories/top_rated/4?page=1&limit=31&telco=zain&user_id=" + session[:user_id].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Fashion Top Rated Videos page fetched", response)

      when 'GET:more_results'

        if params[:category] == 'more_trending'
          url = 'http://46.234.109.113/home_lists/8?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'more_trending_sub_section'
          url = 'http://46.234.109.113/home_lists/16?page=' + params[:page] + '&limit=18'
        end

        if params[:category] == 'more_music_trends'
          url = 'http://46.234.109.113/home_lists/11?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'more_music_trends_sub_section'
          url = 'http://46.234.109.113/home_lists/17?page=' + params[:page] + '&limit=12'
        end

        if params[:category] == 'more_most_viewed'
          url = 'http://46.234.109.113/home_lists/14?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'more_comedy_time'
          url = 'http://46.234.109.113/home_lists/15?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'more_comedy_in_play'
          url = 'http://46.234.109.113/home_lists/18?page=' + params[:page] + '&limit=18'
        end

        if params[:category] == 'bollywood_latest'
          url = 'http://46.234.109.113/api/categories/latest/1?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'bollywood_featured'
          url = 'http://46.234.109.113/api/categories/featured/1?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'bollywood_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/1?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'drama_latest'
          url = 'http://46.234.109.113/api/categories/latest/2?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'drama_featured'
          url = 'http://46.234.109.113/api/categories/featured/2?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'drama_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/2?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'music_latest'
          url = 'http://46.234.109.113/api/categories/latest/3?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'music_featured'
          url = 'http://46.234.109.113/api/categories/featured/3?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'music_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/3?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'fashion_latest'
          url = 'http://46.234.109.113/api/categories/latest/4?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'fashion_featured'
          url = 'http://46.234.109.113/api/categories/featured/4?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'fashion_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/4?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'comedy_latest'
          url = 'http://46.234.109.113/api/categories/latest/5?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'comedy_featured'
          url = 'http://46.234.109.113/api/categories/featured/5?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'comedy_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/5?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'cooking_latest'
          url = 'http://46.234.109.113/api/categories/latest/6?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'cooking_featured'
          url = 'http://46.234.109.113/api/categories/featured/6?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'cooking_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/6?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'movies_latest'
          url = 'http://46.234.109.113/api/categories/latest/9?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'movies_featured'
          url = 'http://46.234.109.113/api/categories/featured/9?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'movies_top_rated'
          url = 'http://46.234.109.113/api/categories/top_rated/9?page=' + params[:page] + '&limit=24'
        end

        if params[:category] == 'more_recent_music'
          url = 'http://46.234.109.113/home_lists/17?page=' + params[:page] + '&limit=24'
        end

        response = HTTParty.get(url)
        response.to_json

        ajax_success("More results fetched", response)

      when 'GET:search_results'

        if session[:phone_number] != ""
          phone_number = session[:phone_number]
        else
          phone_number = '090078601'
        end

        url = "http://46.234.109.113/home/search?query=" + params[:query].to_s + "&phone_no=" + phone_number.to_s + "&telco=zain&limit=12"
        url = URI.encode url
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Search results fetched", response)

      when 'GET:album_results'
        if session[:phone_number] != ""
          url = "http://46.234.109.113/song_albums/" + params[:id].to_s + "?user_id=" + session[:user_id].to_s
        else
          url = "http://46.234.109.113/song_albums/" + params[:id].to_s
        end
         

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Album results fetched", response)

      when 'GET:artist_songs'

        if session[:phone_number] != ""
          url = "http://46.234.109.113/songs/artists/" + params[:id].to_s + "?user_id=" + session[:user_id].to_s
        else
          url = "http://46.234.109.113/songs/artists/" + params[:id].to_s 
        end
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Artist songs fetched", response)

      when 'GET:get_user_playlists'

        user_id = session[:user_id]

        url = "http://46.234.109.113/api/song_playlists?user_id=" + user_id.to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Playlists fetched", response)

       when 'GET:get_user_favorites'

        phone_number = session[:phone_number]

        if phone_number != ""

          url = "http://46.234.109.113/users/get_user_likes?msisdn=" + phone_number.to_s + "&page=1&per_page=50"

          response = HTTParty.get(url)
          response.to_json

        else
          response = 0
        end

        ajax_success("Favorites fetched", response)

      when 'GET:user_favorite_albums'

        url = "http://46.234.109.113/song_albums/get_user_likes?user_id=" + session[:user_id].to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:user_favorite_artists'

        url = "http://46.234.109.113/api/song_artists/get_liked_song_artists?user_id=" + session[:user_id] .to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:album_favorite'

        phone_number = session[:phone_number]

        url = "http://46.234.109.113/song_albums/like?user_id=" + session[:user_id].to_s + "&song_album_id=" + params[:id].to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:album_unfavorite'

        phone_number = session[:phone_number]

        url = "http://46.234.109.113/song_albums/unlike?user_id=" + session[:user_id].to_s + "&song_album_id=" + params[:id].to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:artist_favorite'

        url = "http://46.234.109.113/api/song_artists/like?user_id=" + session[:user_id].to_s + "&song_artist_id=" + params[:id].to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:artist_unfavorite'

        phone_number = session[:phone_number]

        url = "http://46.234.109.113/api/song_artists/unlike?user_id=" + session[:user_id].to_s + "&song_artist_id=" + params[:id].to_s

        response = HTTParty.get(url)
        response.to_json

        ajax_success("Favorites fetched", response)

      when 'GET:test_login'
      
        session[:phone_number] = "khtest1234"

        ajax_success("test login", 1)

      when 'GET:login_message'
      
        url = "http://46.234.109.113/telco/mobilink/banner_msg"
        
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:send_pin'
        
        phone_number = params[:phone_number]

        url = "http://46.234.109.113/telco/mt2_subscription/check_user_status?msisdn=" + phone_number.to_s
        
        response = HTTParty.get(url)
        response.to_json

        url = "http://46.234.109.113/telco/mt2_subscription/get_user_info?msisdn=" + phone_number.to_s
        response_user_info = HTTParty.get(url)
        response_user_info.to_json

        if response["IsProvisioned"] == true && response_user_info["Response"]["Status"] != "Active"

          url = "http://46.234.109.113/home/appstart?udid=" + phone_number.to_s + "&phone_no=" + phone_number.to_s + "&web_user=1"
          check_status_response = HTTParty.get(url)
          check_status_response.to_json

          session[:temp_phone_number] = phone_number

          session[:user_id] = check_status_response["user"]["id"]
          session[:name] = check_status_response["user"]["name"]
          
          url = "http://46.234.109.113/telco/mt2_subscription/send_pin_sms?msisdn=" + phone_number.to_s
          response_two = HTTParty.get(url)
          response_two.to_json

          session[:response_code] = response_two["ResponseCode"]

        end

        combine_response = []

        combine_response[0] = response["IsProvisioned"]
        combine_response[1] = response_user_info["Response"]["Status"]  

        combine_response.to_json

        ajax_success("Login", combine_response)

      when 'GET:login'
        
        phone_number = params[:phone_number]
        pin_number = params[:pin_number]

        url = "http://46.234.109.113/users/login?type=1&msisdn=" + phone_number.to_s + "&password=" + pin_number.to_s
        response = HTTParty.get(url)
        response.to_json

        if response["status"] == 1
        
          url = "http://46.234.109.113/home/appstart?udid=" + phone_number.to_s + "&phone_no=" + phone_number.to_s + "&web_user=1"
          check_status_response = HTTParty.get(url)
          check_status_response.to_json

          session[:user_id] = check_status_response["user"]["id"]
          session[:name] = check_status_response["user"]["name"]
          
          session[:phone_number] = phone_number
        
        end

        ajax_success("Login response", response)
         
      when 'GET:subscription'
        
        phone_number = session[:temp_phone_number]
        user_id = session[:user_id]
        pin_number = params[:pin_number]
        response_code = session[:response_code]

        url = "http://46.234.109.113/telco/mt2_subscription/subscribe?msisdn=" + phone_number.to_s + "&pin=" + pin_number.to_s + "&pin_request_id=" + response_code.to_s + "&user_id=" + user_id.to_s

        response = HTTParty.get(url)
        response.to_json

        session[:phone_number] = phone_number

        ajax_success("Home page section fetched", response)

      when 'GET:forgot_password'

        url = "http://46.234.109.113/users/forgot_password?msisdn=" + params[:phone_number].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:reset_pin'

        url = "http://46.234.109.113/users/forgot_password?msisdn=" + session[:temp_phone_number].to_s
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:logout'

        session[:phone_number] = ""
        session[:name] = ""
        session[:user_id] = ""
        session[:telco] = ""
        session[:just_logged_out] = ""

        ajax_success("Logout success", 1)

      when 'GET:just_logged_out'

        puts "Session -> " + session[:just_logged_out].to_s
        if session[:just_logged_out] == ""
          response = 1
          session[:just_logged_out] = "junk"
          puts "Session -> " + session[:just_logged_out].to_s
        else
          response = 2 
        end
        puts "Session -> " + session[:just_logged_out].to_s
        ajax_success("Just logged out check", response)

       when 'GET:check_login_status'

        response = 1

        if session[:phone_number] == ""
          response = 0
        end

        ajax_success("Login status check", response)

       when 'GET:post_video_comment'
        session[:name] = params[:name]
        puts "Session user_id -> " + session[:user_id].to_s
        url2 = "http://46.234.109.113/users/set_name/" + session[:user_id].to_s
        query2 = { name: params[:name] }
        res = HTTParty.post(url2, body: query2 )

        url = "http://46.234.109.113/comments/new/video/" + params[:id].to_s
        query = { user_id: session[:user_id].to_s, text: params[:text].to_s }
        res = HTTParty.post(url, body: query) 
        res.to_json
        ajax_success("Single video comment and set name", res)

      when 'GET:video_comments'
        
        id = params[:id]
        url = "http://46.234.109.113/comments/video/" + id.to_s
     
        response = HTTParty.get(url)
        response.to_json

        combine_response = []
        combine_response[0] = response
        combine_response[1] = session[:user_id].to_s
     
        ajax_success("Single video comments", combine_response)

      when 'GET:edit_comment'
        
        url = "http://46.234.109.113/comments/edit?user_id=" + session[:user_id].to_s + "&comment_id=" + params[:id].to_s + "&text=" + params[:text].to_s
        url = URI.encode url
        response = HTTParty.get(url)
        response.to_json

        puts response
     
        ajax_success("Edit comment", response)

      when 'GET:delete_comment'
        
        url = "http://46.234.109.113/comments/delete?user_id=" + session[:user_id].to_s + "&comment_id=" + params[:id].to_s
        url = URI.parse(url)
        response = HTTParty.get(url)
        response.to_json
     
        ajax_success("Delete comment", response)

      when 'GET:single_video_details'
        
        id = params[:id]
        phone_number = session[:phone_number]
          
        url = "http://46.234.109.113/api/videos/" + id.to_s + "?phone_no=" + phone_number.to_s + "&telco=zain"

        response = HTTParty.get(url)
        response.to_json
       
        ajax_success("Single video details", response)

       when 'GET:single_video_like'
        
        id = params[:id]
        phone_number = session[:phone_number]
        if phone_number != ""
          
          url = "http://46.234.109.113/api/videos/like?phone_no=" + phone_number + "&video_id=" + id
       
          response = HTTParty.get(url)
          response.to_json
        else
          response = 0
        end
       
        ajax_success("Single video like", response)

      when 'GET:single_video_unlike'
        
        id = params[:id]
        phone_number = session[:phone_number]
        if phone_number != ""
          
          url = "http://46.234.109.113/api/videos/unlike?phone_no=" + phone_number + "&video_id=" + id
       
          response = HTTParty.get(url)
          response.to_json
        else
          response = 0
        end
       
        ajax_success("Single video unlike", response)

      when 'GET:single_song_details'
        
        id = params[:id]
        phone_number = session[:phone_number]
        if phone_number != ""
          
          url = "http://46.234.109.113/songs/" + id.to_s + "?phone=" + phone_number.to_s
       
          response = HTTParty.get(url)
          response.to_json
        else
          url = "http://46.234.109.113/songs/" + id.to_s 
       
          response = HTTParty.get(url)
          response.to_json
        end
       
        ajax_success("Single song details fetched", response)

      when 'GET:playlist_songs'
        
        id = params[:id]

        url = "http://46.234.109.113/api/song_playlists/" + id.to_s + "?user_id=" + session[:user_id].to_s

        puts params
        puts response
        URI.encode(url)
       
        response = HTTParty.get(url)
        response.to_json
       
        ajax_success("Home page section fetched", response)

      when 'GET:delete_song'
        playlist_id = params[:playlist_id]
        song_id = params[:song_id]
        phone_number = session[:phone_number]

        url = "http://46.234.109.113/api/song_playlists/songs/remove?song_id=" + song_id + "&user_id=" + session[:user_id].to_s + "&playlist_id=" + playlist_id 
        
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:delete_playlist'
        id = params[:id]
        phone_number = session[:phone_number]

        url = "http://46.234.109.113/api/song_playlists/delete_playlist?user_id=" + session[:user_id].to_s + "&playlist_id=" + id
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:create_playlist'
        name = params[:name]
        phone_number = session[:phone_number]

        url = "http://46.234.109.113/api/song_playlists/create_playlist?user_id=" + session[:user_id].to_s + "&name=" + name
        url = URI.encode url
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

       when 'GET:add_song_to_playlist'
        
        song_id = params[:song_id]
        playlist_id = params[:playlist_id]
        phone_number = session[:phone_number]

        url = "http://46.234.109.113/api/song_playlists/add_song?user_id=" + session[:user_id].to_s + "&song_id=" + song_id + "&playlist_id="+ playlist_id
        response = HTTParty.get(url)
        response.to_json

        ajax_success("Home page section fetched", response)

      when 'GET:list_user_playlists'

        phone_number = session[:phone_number]
        res_mapping = []
        
        if phone_number != ''

          url = "http://46.234.109.113/api/song_playlists?user_id=" + session[:user_id].to_s 
          response = HTTParty.get(url)
          response.to_json

          response['data'].each { |res|
              res_mapping << {
                'id' => res['id'],
                'name' => res['name']
              }
          }

        else 

          res_mapping = nil

        end

        ajax_success("Playlists fetched", res_mapping)

      when 'GET:featured_videos'
        url = params[:url]
        response = HTTParty.get(url)
        response.to_json

        res_mapping = []

        response['data'].each { |res|
            res_mapping << {
              'id' => res['id'],
              'title' => res['title'],
              'name' => res['name'],
              'views' => res['views'],
              'duration' => res['duration'],
              'thumb_url' => res['thumb_url'],
            }
        }

        ajax_success("Featured videos section fetched", res_mapping)

      end

      rescue Exception => e
      	ajax_fail(e.message)
      end

    end

end

private

def ajax_success(message, data = [], redirect_url=nil, redirect_delay=nil)
  resp = {
    success: true,
    message: message,
    data: data
  }
  ajax_resp(resp, redirect_url, redirect_delay, 200)
end

def ajax_fail(message, errors=[], redirect_url=nil, redirect_delay=nil)
  resp = {
    success: false,
    message: message,
    errors: errors,
  }
  ajax_resp(resp, redirect_url, redirect_delay, 200)
end

def ajax_resp(resp, redirect_url, redirect_delay, code)
  resp[:redirect_url]=redirect_url if redirect_url
  resp[:redirect_delay]=redirect_delay if redirect_delay
  render json: resp, status: code
end

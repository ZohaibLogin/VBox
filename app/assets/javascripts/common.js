$(document).pjax('a.ajax-link', '#pjax-container');

$(document).on('pjax:timeout', function(e) {

      e.preventDefault();

});


/*
$(document).on('pjax:click', function(e) {

      e.preventDefault();

      $('#cover').fadeIn(100);
      $("body").css("overflow", "hidden");

});
*/

function setFullWidth() {
    setTimeout(function() {
          var mainContentEl = $('.kh-main-content');
          mainContentEl.addClass('content-full-width');
    }, 300);
}  

function getParameterByName(name) {

  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
  results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));

}

$(document).on('pjax:end', function(e) {

      e.preventDefault();

      var path = window.location.pathname;
      var page = path.split("/").pop();

      var menuBarEl = $('.fa-bars'),
          leftNavEl = $('.kh-left-nav'),
          mainContentEl = $('.kh-main-content');

      if (leftNavEl.is(':visible')) {
            leftNavEl.fadeOut(500);
      }

      $('.kh-main-content').addClass('v-show');

      if (page != '' && $('.home-btn').hasClass('active-menu')) {
        $('.v-main-menu .home-btn').removeClass('active-menu');
      }
      if (page != 'favorites' && $('.v-favorite-icon').hasClass('active-favorites')) {
        $('.v-favorite-icon').removeClass('active-favorites');
      }
      if (page != 'playlists' && $('.v-playlist-icon').hasClass('active-playlists')) {
        $('.v-playlist-icon').removeClass('active-playlists');
      }

      // Layouts events

      

      // Playlists Page

      if (page == 'edit_playlists') {

        $('.playlist-content').empty();
       
        editPlaylistPageCalls();        

      }

      if (page == 'playlists') {

        $('.v-playlist-icon').addClass('active-playlists');

        $('.p-content').empty();
       
        playlistPageCalls();       

      }

      // Favorite Page

      if (page == 'favorites') {

        $('.v-favorite-icon').addClass('active-favorites');

        $('.v-fav-videos').empty();
        $('.v-fav-albums').empty();
        $('.v-fav-artists').empty();

        favoritesPageAjaxCalls();

      }

      // Search Page

      if (page == 'search') {

            searchPageAjaxCalls();

      }

      if (page == 'video') {

        videoComments();

      }

      // Homepage

      if (page == '') {

        $('.v-main-menu .home-btn').addClass('active-menu');

        homepageAjaxCalls();

      }
      
      // Videos page

      if (page == 'videos') {

        videosPageAjaxCalls();

     }

      // Music Page Latest section calls

      if (page == 'music') {

            musicPageAjaxCalls();

      }

      if (page == 'bollywood') {

        bollywoodPageAjaxCalls();

      }

      if (page == 'drama') {

        dramaPageAjaxCalls();

      }

      if (page == 'comedy') {

        comedyPageAjaxCalls();

      }

      if (page == 'movies') {

        moviesPageAjaxCalls();
      }

      if (page == 'fashion') {

        fashionPageAjaxCalls();

      }

      if (page == 'mashups') {

        music_mood_call('moods_mashups');

      }
      if (page == 'bhangra') {

        music_mood_call('moods_bhangra');

      }
      if (page == 'sad') {

        music_mood_call('moods_sad');

      }
      if (page == 'slow') {

        music_mood_call('moods_slow');

      }
      if (page == 'party') {

        music_mood_call('moods_party');

      }
      if (page == 'romantic') {

        music_mood_call('moods_romantic');

      }
      if (page == 'sufi') {

        music_mood_call('moods_sufi');

      }

      if (page == 'music_trends') {

        album_page_call('music_trends');

      }
      if (page == 'latest_music') {

        latest_album_call('latest_music');

      }
      if (page == 'featured_artists') {

        featured_artists_call('featured_artists');

      }

});


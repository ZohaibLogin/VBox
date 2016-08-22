var languageRegionList = [];

function changeRegion(id) {
    
    var markupId = id;
    id = id.charAt(0);
    var regionId = 0;
    if ($('#' + markupId).hasClass('active-lang')) {
          $.notify("Already selected!");
          return;
    }
    if ($('#' + markupId).hasClass('all-region-btn')) {
          regionId = 0;
    }
    else {
          regionId = languageRegionList[id].id;
    }
    var dataToSend = { region_id: regionId };
    
    bp_ajax({

          action: 'set_language_region',
          method: 'get',
          data: dataToSend,
          contentType: 'application/json',
          notifications: false,
          spinner: true,
          callback: function(data) {

                location.reload();
    
          }

    });

}

$(window).ready(function() {

      bp_ajax({
  
            action: 'list_user_playlists',
            method: 'get',
            contentType: 'application/json',
            notifications: false,
            spinner: true,
            callback: function(data) {

                  if (data['data'] != null) {

                        if (data['data'].length > 0) {

                              for (var i=0; i<data['data'].length; i++) {

                                    pName = '<p class="playlist-name">' + data['data'][i]['name'] + '</p>';

                                    pAddBtn = '<i class="add-song-to-playlist fa fa-plus-circle"></i>';

                                    pId = '<input class="playlist-id" type="hidden" value=' + data['data'][i]['id'] + '>'; 

                                    htmlRow = '<div class="playlist-details">' + pId + pName + pAddBtn + '</div>';

                                    $('#myModal .playlist-modal-content .modal-body').append(htmlRow); 
                              
                              }
                        }
                  }
      
            }

      });
      /*
      bp_ajax({
  
            action: 'get_language_regions',
            method: 'get',
            contentType: 'application/json',
            notifications: false,
            spinner: true,
            callback: function(data) {

                  if (data['data'] != null) {

                        if (data['data'].length) {

                              $('.language-region-menu').removeClass('no-display');

                              var seletedBool = false;

                              for (var i=0; i<data['data'].length; i++) {
                                    
                                    languageRegionList[i] = { id: data['data'][i]['id'], name: data['data'][i]['name'], selected: data['data'][i]
                                    ['is_selected'] };             

                                    if (languageRegionList[i].selected == true) {
                                          seletedBool = true;
                                          var dyEl = '<div class="region-row"><i class="fa fa-check active-region" aria-hidden="true"></i> <button id=' + i + 'dybtn' + ' onclick="changeRegion(this.id);" class="active-lang"> ' + languageRegionList[i].name + '</button></div>';
                                    }
                                    else {
                                          var dyEl = '<button id=' + i + 'dybtn' + ' onclick="changeRegion(this.id);"> ' + languageRegionList[i].name + '</button>';
                                    }

                                    $('.language-region-menu .video-categories').append(dyEl);

                              }

                              if (seletedBool == false) {

                                    var dyEl = '<i class="fa fa-check active-region" aria-hidden="true"></i>';

                                    $('#all-regions').addClass('active-lang');

                                    $('.language-region-menu .video-categories .all-region-row').prepend(dyEl);
                                    
                              }

                        }
                  }
      
            }

      });
      */

});
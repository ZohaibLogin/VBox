var   htmlRowEl,
      dynamicPartOne,
      dynamicPartTwo,
      dynamicPartThree,
      dynamicPartFour,
      dynamicPartFive,
      dynamicPartSix,
      dynamicParts,
      outerColDiv = '<div class="col-md-2 col-sm-3 col-xs-6 no-padding">',
      videoBlockDiv = '<div class="video-block single-song-block">',
      musicTitleDiv = '<div class="songs-content-wrapper">',
      twoClosingDivs = '</div></div>';

  var rowInitial = outerColDiv + videoBlockDiv;

function featured_artists_call(actionStr) {

  bp_ajax({

    action: actionStr,
    method: 'get',
    contentType: 'application/json',
    notifications: false,
    spinner: true,
    callback: function(data) {

        for (var i = 0; i < data['data']['artist_list']['data'].length; i++) {

        dynamicPartOne = '<a href="/music?artist_id=' + data['data']['artist_list']['data'][i]['id'] + '"><img src=' + data['data']['artist_list']['data'][i]['thumb_url'] + '></img></a>';
        dynamicPartThree = '<a href="/music?artist_id=' + data['data']['artist_list']['data'][i]['id'] + '"><img class="searched-song-play-action song-play-action album-page-link" src="play.png"> </img></a>';
        dynamicPartFour = '<a href="/music?artist_id=' + data['data']['artist_list']['data'][i]['id'] + '"><p>' + data['data']['artist_list']['data'][i]['name'] + '</p></a>';

        dynamicPartsOne =  dynamicPartThree;
        dynamicPartsTwo = musicTitleDiv + dynamicPartFour;                      

        htmlRowEl = rowInitial + dynamicPartOne + dynamicPartsOne + dynamicPartsTwo + twoClosingDivs;

        $('.vs-wrapper').append(htmlRowEl);

        }

    }

  });
}

function latest_album_call(actionStr) {

  bp_ajax({

    action: actionStr,
    method: 'get',
    contentType: 'application/json',
    notifications: false,
    spinner: true,
    callback: function(data) {

        for (var i = 0; i < data['data']['song_albums']['data'].length; i++) {

        dynamicPartOne = '<a href="/music?id=' + data['data']['song_albums']['data'][i]['id'] + '"><img src=' + data['data']['song_albums']['data'][i]['thumb_url'] + '></img></a>';
        dynamicPartThree = '<a href="/music?id=' + data['data']['song_albums']['data'][i]['id'] + '"><img class="searched-song-play-action song-play-action album-page-link" src="play.png"> </img></a>';
        dynamicPartFour = '<a href="/music?id=' + data['data']['song_albums']['data'][i]['id'] + '"><p>' + data['data']['song_albums']['data'][i]['title'] + '</p></a>';
        dynamicPartFive = '<a href="/music?id=' + data['data']['song_albums']['data'][i]['id'] + '"><p style="font-style:italic;">' + data['data']['song_albums']['data'][i]['artist_name'] + '</p></a>';

        dynamicPartsOne =  dynamicPartThree;
        dynamicPartsTwo = musicTitleDiv + dynamicPartFour + dynamicPartFive;                      

        htmlRowEl = rowInitial + dynamicPartOne + dynamicPartsOne + dynamicPartsTwo + twoClosingDivs;

        $('.vs-wrapper').append(htmlRowEl);

        }

    }

  });
}

function album_page_call(actionStr) {

  bp_ajax({

    action: actionStr,
    method: 'get',
    contentType: 'application/json',
    notifications: false,
    spinner: true,
    callback: function(data) {

        for (var i = 0; i < data['data']['data'].length; i++) {

        dynamicPartOne = '<a href="/music?id=' + data['data']['data'][i]['id'] + '"><img src=' + data['data']['data'][i]['thumb_url'] + '></img></a>';
        dynamicPartThree = '<a href="/music?id=' + data['data']['data'][i]['id'] + '"><img class="searched-song-play-action song-play-action album-page-link" src="play.png"> </img></a>';
        dynamicPartFour = '<a href="/music?id=' + data['data']['data'][i]['id'] + '"><p>' + data['data']['data'][i]['title'] + '</p></a>';
        dynamicPartFive = '<a href="/music?id=' + data['data']['data'][i]['id'] + '"><p style="font-style:italic;">' + data['data']['data'][i]['artist_name'] + '</p></a>';

        dynamicPartsOne =  dynamicPartThree;
        dynamicPartsTwo = musicTitleDiv + dynamicPartFour + dynamicPartFive;                      

        htmlRowEl = rowInitial + dynamicPartOne + dynamicPartsOne + dynamicPartsTwo + twoClosingDivs;

        $('.vs-wrapper').append(htmlRowEl);

        }

    }

  });
}

function music_mood_call(actionStr) {

  bp_ajax({

    action: actionStr,
    method: 'get',
    contentType: 'application/json',
    notifications: false,
    spinner: true,
    callback: function(data) {

        for (var i = 0; i < data['data']['songs']['data'].length; i++) {

        dynamicPartOne = '<a href="/music?song_id=' + data['data']['songs']['data'][i]['id'] + '"><img src=' + data['data']['songs']['data'][i]['thumb_url'] + '></img></a>';
        dynamicPartThree = '<a href="/music?song_id=' + data['data']['songs']['data'][i]['id'] + '"><img class="searched-song-play-action song-play-action album-page-link" src="play.png"> </img></a>';
        dynamicPartFour = '<a href="/music?song_id=' + data['data']['songs']['data'][i]['id'] + '"><p>' + data['data']['songs']['data'][i]['title'] + '</p></a>';
        dynamicPartFive = '<span>' + data['data']['songs']['data'][i]['views'] + ' views </span>';
        dynamicPartSix = '<div class="clearfix"></div> <span class="flaticon-clock96">' + data['data']['songs']['data'][i]['duration'].substr(3) + '</span>';

        dynamicPartsOne =  dynamicPartThree;
        dynamicPartsTwo = musicTitleDiv + dynamicPartFour + dynamicPartFive + dynamicPartSix;                      

        htmlRowEl = rowInitial + dynamicPartOne + dynamicPartsOne + dynamicPartsTwo + twoClosingDivs;

        $('.vs-wrapper').append(htmlRowEl);

        }

    }

  });
}

function bp_ajax(params) {
  var defaultParams = {
    url: '/ajax',
    action: '',
    method: 'get',
    contentType: 'application/json',
    data: {},
    spinnerEl: $('.bp-ajax-spinner'),
    spinner: true,
    notifications: true,
    notificationEl: $('.bp-notification-bar'),
    callback: $.noop,
    success: function(resp, jqXHR, textStatus) {
      params.spinner && params.spinnerEl && params.spinnerEl.length && params.spinnerEl.hide();
      if (typeof resp != 'object') return;
      if (params.notifications && params.notificationEl && params.notificationEl.length) {
        if (resp && resp.success && resp.message) bp_addNotification({parentEl: params.notificationEl, type: 'success', message: resp.message});
        else if (resp && !resp.success && resp.message) bp_addNotification({parentEl: params.notificationEl, type: 'error', message: resp.message});
      }
      
      if (resp.redirect_url && resp.redirect_delay) {
        setTimeout(function() { window.location.href = resp.redirect_url; }, resp.redirect_delay);
      }
      
      params.callback && params.callback(resp, jqXHR, textStatus);
        
    },
    error: function(jqXHR, textStatus, err) {
      params.spinner && params.spinnerEl && params.spinnerEl.length && params.spinnerEl.hide();
      //if (resp && !resp.success && params.notifications && params.notificationEL && params.notificationEL.length) bp_addNotification({parentEl: params.notificationEl, type: 'error', message: textStatus});
      params.callback && params.callback(err, jqXHR, textStatus);
    },
    beforeSend: function(jqXHR, textStatus) {}
  }
  params = $.extend(true, {}, defaultParams, params);
  
  params.spinner && params.spinnerEl && params.spinnerEl.length && params.spinnerEl.show();
  
  $.ajax({
    url: params.url + '/' + params.action,
    method: params.method,
    data: params.data,
    contentType: params.dataType,
    beforeSend: params.beforeSend,
    success: params.success,
    error: params.error,
  });
  
}


function bp_addNotification(params) {
  var defaultParams = {
    parentEl: $('.bp-notification-bar'),
    type: 'info',
    message: null,
    close: true,
    autoHide: false,
    autoHideTime: 0
  }
  
  params = $.extend(true, {}, defaultParams, params);
  if (!params.message) return null;
  
  var notificationEl = $('<div class="bp-notify"></div>'),
      classes = '',
      messageHTML = '';
  
  switch (params.type) {
    case 'danger':
    case 'error':
      classes += 'danger ';
      messageHTML += '<b>Error:</b> ';
      break;
      
    case 'warn':
    case 'warning':
      classes += 'warn ';
      messageHTML += '<b>Warning:</b> ';
      break;
      
    case 'info':
    case 'notify':
      classes += 'info ';
      messageHTML += '<b>Info:</b> ';
      break;
    
    case 'success':
    case 'successful':
      classes += 'succes ';
      messageHTML += '<b>Success:</b> ';
      break;
      
    default:
      classes += 'default ';
  }
  
  messageHTML += params.message;
  if (params.close) messageHTML += '<i class="i-icon-cancel-circled close"></i>';
  notificationEl.html(messageHTML).addClass(classes).appendTo(params.parentEl);
  $('i.close', notificationEl).click(function(e) {
    notificationEl.fadeOut();
  });
  return notificationEl;
}
var SUCCESS = 'success';
var DANGER = 'danger';
var WARNING = 'warning';
var PRIMARY = 'primary';
var EMPTY = '';
var UNSELECT = -1;
var ZERO = 0;
var chosenUpdated = 'chosen:updated';

$(document).ajaxStart(function () {
    $("#spinner").show();
    $("#spinner-container").addClass('modal-backdrop-white in');
    $('body').addClass('modal-open');

}).ajaxStop(function () {
    $("#spinner").hide();
    $("#spinner-container").removeClass('modal-backdrop-white in');
    $('body').removeClass('modal-open');
});

function chosenUnselect(element) {
    $(element).val(UNSELECT);
    $(element).trigger(chosenUpdated);
}

function hideModal() {
    $('.modal.in').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
}

function insertModal(id, action, actionMessage, header, content) {
    var modal = '<div class="modal fade" id="' + id + '">'
        + '<div class="modal-dialog">'
        + '<div class="modal-content">'
        + '<div class="modal-header">'
        + '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'
        + '<h4 class="modal-title">' + header + '</h4>'
        + '</div>'
        + '<div class="modal-body">'
        + content
        + '</div>'
        + '<div class="modal-footer">'
        + '<button id="' + id + '-action" type="button" class="btn btn-success">' + actionMessage + '</button>'
        + '<button id="' + id + '-close"  type="button"  class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE"/></button>'
        + '</div>'
        + '</div>'
        + '</div>'
        + '</div>';
    $(document).append(modal);
}

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

function showNotification(message, type, delay) {
    if (typeof(delay) === "undefined" || isNaN(delay)) {
        delay = 5000;
    }
    if (typeof(type) === "undefined") {
        type = SUCCESS;
    }
    $("#alert").notify({
        message: {text: message},
        type: type,
        closeable: 'true',
        transition: 'fade',
        fadeOut: {enabled: true, delay: delay}
    }).show();
}

function validCNP(p_cnp) {
    var i = 0, year = 0, hashResult = 0, cnp = [], hashTable = [2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9];
    if (p_cnp.length !== 13) {
        return false;
    }
    for (i = 0; i < 13; i++) {
        cnp[i] = parseInt(p_cnp.charAt(i), 10);
        if (isNaN(cnp[i])) {
            return false;
        }
        if (i < 12) {
            hashResult = hashResult + ( cnp[i] * hashTable[i] );
        }
    }
    hashResult = hashResult % 11;
    if (hashResult === 10) {
        hashResult = 1;
    }
    year = (cnp[1] * 10) + cnp[2];
    switch (cnp[0]) {
        case 1  :
        case 2 :
        {
            year += 1900;
        }
            break;
        case 3  :
        case 4 :
        {
            year += 1800;
        }
            break;
        case 5  :
        case 6 :
        {
            year += 2000;
        }
            break;
        case 7  :
        case 8 :
        case 9 :
        {
            year += 2000;
            if (year > ( parseInt(new Date().getYear(), 10) - 14 )) {
                year -= 100;
            }
        }
            break;
        default :
        {
            return false;
        }
    }
    if (year < 1800 || year > 2099) {
        return false;
    }
    return ( cnp[12] === hashResult );
}

function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}

function toJSDate(dateTime, ora) {
    var options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
        "second": "2-digit",
        "minute": "2-digit",
        "hour": "2-digit"
    };
    var dateTime = dateTime.split(" ");//dateTime[0] = date, dateTime[1] = time
    var time;
    var date = dateTime[0].split("-");
    date[1] = parseInt(date[1]) - 1;
    if (ora && ora == 1) {
        time = dateTime[1].split(":");
        return new Date(date[0], date[1], date[2], time[0], time[1], time[2], 0).toLocaleString('ro', options);
    }


//(year, month, day, hours, minutes, seconds, milliseconds)
    return new Date(date[0], date[1], date[2]).toLocaleString('ro', options);

}
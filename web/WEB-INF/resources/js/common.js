var SUCCESS = 'success';
var DANGER = 'danger';
var WARNING = 'warning';
var PRIMARY = 'primary';
var INFO = 'info';
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

function toJSDate(dateTimeParam, ora) {
    var options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
        "second": "2-digit",
        "minute": "2-digit",
        "hour": "2-digit"
    };

    var dateTime = dateTimeParam.split(" ");//dateTime[0] = date, dateTime[1] = time
    var time;
    var date = dateTime[0].split("-");
    date[1] = parseInt(date[1]) - 1;
    if (ora && ora == 1) {
        time = dateTime[1].split(":");
        //(year, month, day, hours, minutes, seconds, milliseconds)
        return new Date(date[0], date[1], date[2], time[0], time[1], time[2], 0).toLocaleString('ro', options);
    }
    return new Date(date[0], date[1], date[2]).toLocaleString('ro', options);

}

$(window).scroll(function () {
    if ($(document).scrollTop() > 0) {
        $('#scrollUp').fadeIn(400)
    } else {
        $('#scrollUp').fadeOut(400);
    }
});

function showModal(id, title, content, buttons) {
    var modalHtml = '';
    var modalId = '#' + id;
    if(!buttons){
        buttons = '<button type="button" id="' + id + '-close" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span> &#206;nchide</button>';
    }
    if (id && title && content) {
        modalHtml += '<div class="modal fade" id="' + id + '">'
            .concat('<div class="modal-dialog modal-lg">')
            .concat('<div class="modal-content">')
            .concat('<div class="modal-header">')
            .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>')
            .concat('<h4 class="modal-title">').concat(title).concat('</h4>')
            .concat('</div><div class="modal-body">')
            .concat(content)
            .concat('</div><div class="modal-footer">')
            .concat(buttons)
            .concat('</div></div></div></div>');

        $('body').append(modalHtml);

        $(modalId).modal('show');
    } else {
        throw "you must specify mandatory arguments "
    }
}

function generateButton(id, type, text) {
    var buttonHtml = '';
    if (id) {
        switch (type) {
            case 'submit':
                buttonHtml = '<button type="submit" id="' + id + '" class="btn btn-success"><span class="fa fa-plus">&nbsp;</span>' + text + '</button>';
                break;
            case 'close':
                buttonHtml = '<button type="button" id="' + id + '" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span>' + text + '</button>';
                break;
        }
    }
    return buttonHtml;
}

function generateHistoryTable(articol){
    var counter;
    var dataIesire;
    var persoana;
    var loc;
    var locRecuperare;
    var dataIntrare;
    var detalii;
    var detaliiRecuperare;
    var historyTable = '<div class="wrapper">' +
        '<table class="table table-responsive table-hover"><thead><tr>' +
        '<td>Nr</td><td>Data iesire</td><td>Persoana</td><td>Loc Predare</td><td>Detalii Predare</td><td>Loc Recuperare</td><td>Data intrare</td><td>Detalii Recuperare</td>' +
        '</tr></thead><tbody>';
    if (articol && articol.length > 0) {
        for (var i = 0; i < articol.length; i++) {
            counter = i + 1;
            dataIesire = toJSDate(articol[i].dataPreluarii, 1);
            persoana = articol[i].nume;
            loc = articol[i].denumireLoc;
            locRecuperare = articol[i].denumireLocRecuperare;
            if(!locRecuperare) {
                locRecuperare = EMPTY;
            }
            dataIntrare = articol[i].dataRecuperarii;
            if (dataIntrare) {
                dataIntrare = toJSDate(dataIntrare, 1);
            } else if(i == (articol.length - 1)){
                dataIntrare = '<span style="color:red;">Articolul este încă alocat</span>';
            } else {
                dataIntrare = '';
            }
            detalii = articol[i].detalii;
            detaliiRecuperare = articol[i].detaliiRecuperare;
            if(!detaliiRecuperare){
                detaliiRecuperare = EMPTY;
            }
            historyTable += '<tr><td>' + counter + '</td><td>' + dataIesire + '</td><td>' + persoana + '</td>' +
                '<td>' + loc + '</td><td>' + detalii + '</td><td>' + locRecuperare + '</td><td>' + dataIntrare + '</td><td>' + detaliiRecuperare + '</td></tr>';

        }
    } else {
        historyTable += '<tr><td colspan="8" style="color:red; text-align: center; font-weight: bold; font-size: 14pt;">Nu sunt intrări în evidenţă pentru acest articol</td></tr>';
    }

    historyTable += '</tbody></table></div>';

    return historyTable;

}

function getCod2ByCod1(idCod1, idCod2) {
    var cod2 = $('#' + idCod2);
    cod2.html('<option></option>');
    if (idCod1 && idCod1 != 0) {
        $.ajax({
            type: 'get',
            url: '/api/cod2list/' + idCod1,
            contentType: "application/json",
            success: function (response) {
                var idCod2;
                var denumire2;
                if (typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        idCod2 = response[i].cod2;
                        denumire2 = response[i].denumire2;
                        cod2.append($('<option id="cod2-art' + idCod2 + '"  label="' + denumire2 + '">').val(idCod2).text(denumire2));
                    }
                    cod2.trigger(chosenUpdated);
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
    } else {
        cod2.html('<option></option>').append(' <option disabled>Alege mai intai o categorie COD 1</option>')
    }
    cod2.trigger(chosenUpdated);
}

function getCod2ByMultipleCo1(cod1Arr, idCod2) {
    var cod2 = $('#' + idCod2);
    cod2.html('<option></option>');
    if (cod1Arr && cod1Arr.length != 0) {
        $.each(cod1Arr, function(index, val){
            $.ajax({
                type: 'get',
                url: '/api/cod2list/' + val,
                contentType: "application/json",
                success: function (response) {
                    var idCod2;
                    var denumire2;
                    if (typeof response !== 'undefined') {
                        for (var i = 0; i < response.length; i++) {
                            idCod2 = response[i].cod2;
                            denumire2 = response[i].denumire2;
                            cod2.append($('<option id="cod2-art' + idCod2 + '"  label="' + denumire2 + '">').val(idCod2).text(denumire2));
                        }
                        cod2.trigger(chosenUpdated);
                    }
                },
                error: function (e) {
                    alert("Connection error!");
                }
            });
        });
    } else {
        cod2.html('<option></option>').append(' <option disabled>Alege mai intai o categorie COD 1</option>')
    }
    cod2.trigger(chosenUpdated);
}

$(document).ready(function () {
    $('#an-copyright').text(new Date().getFullYear());
    $('.chosen-select').chosen({
        width: "100%",
        search_contains: true,
        no_results_text: " nu exista!",
        allow_single_deselect: true,
        disable_search_threshold: 3
    });

    $('a').on('click', function (e) {
        var linkLocation = $($(this).attr('href')).offset();
        if (linkLocation)
            $('html,body').animate({scrollTop: linkLocation.top}, "10000", 'linear');
    });

    var selcod1 = $('#selcod1');

    selcod1.on('change', function () {
        getCod2ByCod1($(this).val(), 'selcod1');
    });

});
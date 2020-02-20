$(document).ready(function () {
    $('#RunClient').click(function(e) {
        CallEvent("ingame_editor:RunClient", $('#code').val().trim());
    });
    $('#RunServer').click(function(e) {
        CallEvent("ingame_editor:RunServer", $('#code').val().trim());
    });
});

function SetError(err) {
    if (typeof err !== 'undefined') {
        $('#error').html(err);
    } else {
        $('#error').html('');
    }
}
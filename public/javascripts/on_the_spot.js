$(document).ready(function() {

    $(".on_the_spot_editing").mouseover(function() {
        $(this).css('background-color', '#d5fbe2');
    });
    $(".on_the_spot_editing").mouseout(function() {
        $(this).css('background-color', 'inherit');
    });
    $(".on_the_spot_editing").mouseout(function() {
        $(this).css('font-size', 'inherit');
    });
    $('.on_the_spot_editing').each(initializeOnTheSpot);

});

function initializeOnTheSpot(n) {
    var el = $(this),
            auth_token = el.attr('data-auth'),
            data_url = el.attr('data-url'),
            ok_text = el.attr('data-ok') || 'OK',
            cancel_text = el.attr('data-cancel') || 'Отмена',
            tooltip_text = el.attr('data-tooltip') || 'Нажмите, чтобы изменить ...',
            edit_type = el.attr('data-edittype'),
            select_data = el.attr('data-select'),
            rows = el.attr('data-rows'),
            columns = el.attr('data-columns'),
            load_url = el.attr('data-loadurl'),
            selected = el.attr('data-selected');

    var options = {
        tooltip: tooltip_text,
        placeholder: tooltip_text,
        cancel: cancel_text,
        submit: ok_text,
        select: selected,
        onerror: function (settings, original, xhr) {
            original.reset();
            //just show the error-msg for now
            alert(xhr.responseText);
        },
        submitdata: {
            authenticity_token: auth_token,
            _method: 'put'
        }
    };
    if (edit_type != null) {
        options.type = edit_type;
    }
    if (edit_type == 'select') {
        if (select_data != null) {
            options.data = select_data;
            options.submitdata['select_array'] = select_data;
        }
        if (load_url != null) {
            options.loadurl = load_url;
        }
    }
    else if (edit_type == 'textarea') {
        options.rows = rows;
        options.cols = columns;
    }

    el.editable(data_url, options)
}

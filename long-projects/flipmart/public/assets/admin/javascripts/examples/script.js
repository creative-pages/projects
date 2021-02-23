$(document).ready(function() {
    $('body').on('change', '#brandstatus', function() {
        var id = $(this).attr('data-id');
        if (this.checked) {
            var status = 1;
        } else {
            var status = 0;
        }
        $.ajax({
            url: 'brand-status/'+id+'/'+status,
            method: 'get',
            success: function(result) {
                console.log(result);
            }
        });
    });
});

$(document).ready(function() {
    $('body').on('change', '#categoryStatus', function() {
        var id = $(this).attr('data-id');
        if (this.checked) {
            var status = 1;
        } else {
            var status = 0;
        }
        $.ajax({
            url: 'category-status/'+id+'/'+status,
            method: 'get',
            success: function(result) {
                console.log(result);
            }
        });
    });
});
$(document).ready(function() {
    $('body').on('change', '#subcategoryStatus', function() {
        var id = $(this).attr('data-id');
        if (this.checked) {
            var status = 1;
        } else {
            var status = 0;
        }
        $.ajax({
            url: 'sub-category-status/'+id+'/'+status,
            method: 'get',
            success: function(result) {
                console.log(result);
            },
        });
    });
});

$.validate({
lang: 'es'
});
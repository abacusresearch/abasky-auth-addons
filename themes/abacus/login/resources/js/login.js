(function($) {
    $(document).on("click", " .kc-current-locale-link", function(event) {
        event.preventDefault();
        $(this).parents('.kc-locale').first().toggleClass('hover')
    })
})(jQuery);
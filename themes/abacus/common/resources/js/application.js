(function() {
    $(document).ready(function() {
        $(".floating-label-wrap .form-control").on("input", function() {
            $(this).attr("data-value", $(this).val());
        });
        setTimeout(function() {
            $(".floating-label-wrap .form-control").each(function() {
                if($(this).val()!='') {
                    $(this).attr("data-value", $(this).val());
                }
            });
        }, 100);
    });
})();

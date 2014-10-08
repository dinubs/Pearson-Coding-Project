$(function() {
        $("a[href*=#]:not([href=#])").click(function() {
            if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") && location.hostname == this.hostname) {
                $("li.active").removeClass("active");
                $(this).parent().addClass("active");
                var a = $(this.hash);
                switch(a["selector"]) {
                	case "#about": $("li [href=#about]").parent().addClass("active");
                }
                if (a = a.length ? a : $("[name=" + this.hash.slice(1) + "]"), a.length) return $("html,body").animate({
                    scrollTop: a.offset().top - 70
                }, 1e3), !1;
            }
        });
    });
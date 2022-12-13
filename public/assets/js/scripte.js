(function($) {
    "use strict"

    const navBarShowBtn = document.querySelector('.navbar-show-btn');
    const navBarCollapseDiv = document.querySelector('.navbar-collapse');
    const navBarHideBtn = document.querySelector('.navbar-hide-btn');
    const buttontoggle = document.querySelector('.button-toggle');


    document.querySelector('.button-toggle').onclick = () => {
        const body = document.body;

        if (body.classList.contains('dark')) {
            body.classList.add('light')
            body.classList.remove('dark')
            buttontoggle.innerHTML('go dark')

        } else if (body.classList.contains('light')) {
            body.classList.add('dark')
            body.classList.remove('light')
            buttontoggle.innerHTML('go light')
        }
        // document.querySelector('#search-form').classList.toggle('active');
    };



    navBarShowBtn.addEventListener('click', function() {
        navBarCollapseDiv.classList.add('navbar-show')
    });

    navBarHideBtn.addEventListener('click', function() {
        navBarCollapseDiv.classList.remove('navbar-show');
    });

    document.querySelector('#search-icon').onclick = () => {
        document.querySelector('#search-form').classList.toggle('active');
    };
    document.querySelector('#close').onclick = () => {
        document.querySelector('#search-form').classList.remove('active');
    };


    let arrow = document.querySelectorAll(".arrow");

    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e) => {

            let arrowParent = e.target.parentElement.parentElement;
            console.log(arrowParent);
            arrowParent.classList.toggle("showMenu");

        });

    }

    // Back to top button
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 1500, 'easeInOutExpo');
        return false;
    });




})(jQuery);
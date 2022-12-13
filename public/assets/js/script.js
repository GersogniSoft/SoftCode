(function($) {
    "use strict"

    const navBarShowBtn = document.querySelector('.navbar-show-btn');
    const navBarCollapseDiv = document.querySelector('.navbar-collapse');
    const navBarHideBtn = document.querySelector('.navbar-hide-btn');

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

    // Intro carousel
    var introCarousel = $(".carousel");
    var introCarouselIndicators = $(".carousel-indicators");
    introCarousel.find(".carousel-inner").children(".carousel-item").each(function(index) {
        (index === 0) ?
        introCarouselIndicators.append("<li data-target='#introCarousel' data-slide-to='" + index + "' class='active'></li>"):
            introCarouselIndicators.append("<li data-target='#introCarousel' data-slide-to='" + index + "'></li>");
    });

    introCarousel.on('slid.bs.carousel', function(e) {
        $(this).find('h2').addClass('animate__animated animate__fadeInDown');
        $(this).find('p, .btn-get-started').addClass('animate__animated animate__fadeInUp');
    });



})(jQuery);
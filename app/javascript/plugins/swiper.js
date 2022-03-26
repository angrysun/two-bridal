const initSwiper = () => {
  const swiper_present = document.getElementById("swiper_p");

  if (swiper_present) {
    new Swiper(".mySwiper", {
      spaceBetween: 30,
      slidesPerView: "auto",
      centeredSlides: true,
      loop: true,
      autoplay: {
        delay: 3000,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  }
};

export { initSwiper };

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";
import { initMapbox } from "../plugins/init_mapbox";
import { initDate_calc } from "../plugins/date_calc";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initSweetalert } from "../plugins/init_sweetalert";
import { Swiper } from "../plugins/swiper";

// import "owl.carousel/dist/assets/owl.carousel.css";
// import "owl.carousel";
// initFlatpickr();

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  initFlatpickr();
  initDate_calc();
  initMapbox();
  initAutocomplete();

  initSweetalert(
    ".sweet-alert-delete",
    {
      title: "Are you sure?",
      text: "This action cannot be reversed",
      icon: "warning",
      buttons: {
        cancel: true,
        confirm: "Confirm",
      },
    },
    (value) => {
      if (value) {
        const link = document.querySelector(".delete-link");
        link.click();
      }
    }
  );

  // $(".owl-carousel").owlCarousel({
  //   loop: true,
  //   autoWidth: true,
  //   center: true,
  //   autoplay: true,
  //   autoplayHoverPause: true,
  //   items: 1,
  //   touchDrag: true,
  //   responsive: {
  //     0: {
  //       items: 1,
  //     },
  //     1000: {
  //       items: 3,
  //     },
  //   },
  // });
});

import "controllers"

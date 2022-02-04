const initDate_calc = () => {
  const date_present = document.getElementById("start_date");

  if (date_present) {
    const dates_start = document.getElementById("start_date");
    const dates_end = document.getElementById("end_date");
    // Gets and sets the dates in a variable
    const price_regex = document
      .getElementById("day_price")
      .innerText.match(/\d+/g);
    // Gets the inner text of day_price and matches to get an array of the dress price

    dates_start.addEventListener("input", (event) => {
      let end_d_value = document.getElementById("end_date").value;
      let start_date_value = event.target.value;
      let mili_first = Date.parse(start_date_value);
      let mili_second = Date.parse(end_d_value);
      // conversion to Date and milliseconds
      let days = Math.round((mili_second - mili_first) / (1000 * 60 * 60 * 24));
      // difference_ms = mili_second - mili_first / one_day=1000*60*60*24
      let new_price_regex = price_regex.join("");
      if (Number.isInteger(days)) {
        document.getElementById("price").innerText =
          (days + 1) * new_price_regex;
        document.getElementById("total_price").value =
          (days + 1) * new_price_regex;
      } else {
        document.getElementById("price").innerText = new_price_regex;
        document.getElementById("total_price").value = new_price_regex;
      }
      // If only one date(ex. start date only) was selected or the same day, it would return and show NaN(Not-A-Number)
    });
    dates_end.addEventListener("input", (event) => {
      let start_d_value = document.getElementById("start_date").value;
      let end_date_value = event.target.value;
      let mili_first = Date.parse(start_d_value);
      let mili_second = Date.parse(end_date_value);
      // conversion to Date and milliseconds
      let days = Math.round((mili_second - mili_first) / (1000 * 60 * 60 * 24));
      // difference_ms = mili_second - mili_first / one_day=1000*60*60*24
      let new_price_regex = price_regex.join("");
      if (Number.isInteger(days)) {
        document.getElementById("price").innerText =
          (days + 1) * new_price_regex;
        document.getElementById("total_price").value =
          (days + 1) * new_price_regex;
      } else {
        document.getElementById("price").innerText = new_price_regex;
        document.getElementById("total_price").value = new_price_regex;
      }
      // If only one date(ex. start date only) was selected or the same day, it would return and show NaN(Not-A-Number)
    });
  }
};

export { initDate_calc };

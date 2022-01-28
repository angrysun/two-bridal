import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('dress_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

// TODO: Build an awesome garage!
const carsList = document.querySelector(".cars-list");
const url = "https://wagon-garage-api.herokuapp.com/taygarage/cars";
const form = document.getElementById('new-car');

const insertCar = (car) => {
  const newCar = `<div class="car">
          <div class="car-image">
            <img src="http://loremflickr.com/280/280/Ferrari 308 GTS" />
          </div>
          <div class="car-info">
            <h4>${car.brand} ${car.model}</h4>
            <p><strong>Owner:</strong> ${car.owner}</p>
            <p><strong>Plate:</strong> ${car.plate}</p>
          </div>
        </div>`;
  carsList.insertAdjacentHTML('beforeend', newCar);
};

fetch(url)
  .then(response => response.json())
  .then((data) => {
    data.forEach((car) => {
      insertCar(car);
    });
  });

const createCar = () => {
  const car = {}
  car.brand = document.getElementById('brand').value;
  car.model = document.getElementById('model').value;
  car.plate = document.getElementById('plate').value;
  car.owner = document.getElementById('owner').value;
  return car;
}

form.addEventListener('submit', (event) => {
  event.preventDefault();
  const car = createCar();
  insertCar(car);
  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(car)
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    form.reset();
    document.getElementById('brand').focus();
  });
});

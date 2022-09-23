const planeContainer = document.querySelector(".plane-container");
const seats = document.querySelectorAll(".row .seat:not(.occupied)");
const count = document.getElementById("count");
const total = document.getElementById("total");

populateUI();


function updateSeat() {
  const selectedSeats = document.querySelectorAll(".row .seat.selected");
  const occuipedSeats = document.querySelectorAll(".row .seat.occupied");
  const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));
  const selectedSeatsCount = selectedSeats.length;

  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));
  localStorage.setItem(
    "selectedSeatTotalPrice",
    selectedSeatsCount * TICKET_PRICE
  );

  //count.innerText = selectedSeatsCount;
  //total.innerText = selectedSeatsCount * TICKET_PRICE;
}

function populateUI() {
  const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));
  const totalPrice = localStorage.getItem("selectedSeatTotalPrice");

  if (selectedSeats !== null && selectedSeats.length !== 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add("selected");
      }
    });
  }

  if (totalPrice !== null && totalPrice > 0) {
    //total.innerText = totalPrice;
    //count.innerText = selectedSeats.length;
  }
}

planeContainer.addEventListener("click", (event) => {
  if (
    event.target.classList.contains("seat") &&
    !event.target.classList.contains("occupied")
  ) {
    event.target.classList.toggle("selected");
  }
  updateSeat();
});
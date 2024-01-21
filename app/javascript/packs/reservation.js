document.addEventListener("DOMContentLoaded", function () {
  const movieSelect = document.getElementById("reservation_movie_id");
  const scheduleSelect = document.getElementById("schedule_id");

  movieSelect.addEventListener("change", function () {
    const movieId = movieSelect.value;
    fetch(`/admin/get_schedules?movie_id=${movieId}`)
      .then((response) => response.json())
      .then((data) => {
        while (scheduleSelect.firstChild) {
          scheduleSelect.removeChild(scheduleSelect.firstChild);
        }
        data.forEach((schedule) => {
          const option = document.createElement("option");
          option.value = schedule.id;
          const startTime = new Date(schedule.start_time);
          const formattedTime = startTime.toLocaleTimeString("en-US", {
            hour: "2-digit",
            minute: "2-digit",
          });
          option.textContent = formattedTime;
          scheduleSelect.appendChild(option);
        });
      });
  });
});

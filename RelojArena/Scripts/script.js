document.getElementById("startButton").addEventListener("click", function () {
    let timeLeft = 60;
    const timerElement = document.getElementById("timer");
    const messageElement = document.getElementById("message");

    // Esconder el mensaje al iniciar
    messageElement.style.display = "none";

    // Función para actualizar el temporizador
    const countdown = setInterval(function () {
        timerElement.innerHTML = timeLeft;
        timeLeft--;

        if (timeLeft < 0) {
            clearInterval(countdown);
            messageElement.style.display = "block";
            messageElement.innerHTML = "¡Tiempo terminado!";
        }
    }, 1000);
});

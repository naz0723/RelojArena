<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RelojArena.aspx.cs" Inherits="RelojArena.RelojArena" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Temporizador Digital</title>
    <!-- Vincula el archivo CSS -->
    <link href="~/Content/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
      
    <form id="form1" runat="server">
        <div class="timer-container">
            <div id="timer" class="timer">60.000</div>
            <button type="button" id="startButton">Iniciar</button>
            <div id="message" class="message"></div>
        </div>
    </form>

    <!-- Vincula el archivo JavaScript -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("startButton").addEventListener("click", function () {
                let timeLeft = 60;
                let milliseconds = 0;
                const timerElement = document.getElementById("timer");
                const messageElement = document.getElementById("message");

                // Esconde el mensaje de "¡Tiempo terminado!" al comenzar
                messageElement.style.display = "none";

                // Actualiza el temporizador cada 10 milisegundos (1000ms / 100milisegundos = 10 actualizaciones por segundo)
                const countdown = setInterval(function () {
                    milliseconds -= 10;  // Disminuye milisegundos por 10

                    if (milliseconds < 0) {
                        milliseconds = 990;  // Reinicia milisegundos en 999 (simulando el conteo de milisegundos)
                        timeLeft--; // Decrementa el segundo
                    }

                    if (timeLeft < 0) {
                        clearInterval(countdown);  // Detiene el temporizador
                        messageElement.style.display = "block";  // Muestra el mensaje
                        messageElement.innerHTML = "¡Tiempo terminado!";
                    }

                    // Muestra el tiempo con milisegundos
                    timerElement.innerHTML = `${timeLeft}.${milliseconds.toString().padStart(3, '0')}`;
                }, 10); // Actualización cada 10 ms
            });
        });
    </script>
</body>
</html>
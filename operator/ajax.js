var klasaInpt = document.getElementById("klasa");

function someAjax(id) {
    var lenght = id.length;
    var taskId = id.slice(0, lenght-1);
    var answer = id.slice(lenght-1, lenght);
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "s_update-task.php?par1=" + taskId + "&par2=" + answer);
    xhttp.send();
}
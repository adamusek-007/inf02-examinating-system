var form = document.getElementById("form");
// 
form.addEventListener("submit", function(event) {
    event.preventDefault();
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        document.getElementById("txtResp").innerHTML =
        this.responseText;
        form.submit();
    }
    xhr.open("POST", "s_user-add-check.php?p1=", true);
    xhr.send(new FormData(form));
});
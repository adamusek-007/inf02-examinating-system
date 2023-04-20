var form = document.getElementById("form");

form.addEventListener("submit", function(event) {
    event.preventDefault();
    
    
});

function submitForm(userAnswerElement) {

    var userAnswer = userAnswerElement.getAttribute("name");
    var correctAnswer = document.getElementById("correct-answer").innerHTML;
    var correctAnswerButtonXPath = "//input[@name=\""+ correctAnswer + "\"]";
    var correctButton = document.evaluate(correctAnswerButtonXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    var questionId = document.getElementById("q-id-input").value;


    var xhr = new XMLHttpRequest();
        if (userAnswer == correctAnswer) {
            // ! W przypadku gdy jest zadeklarowana poprawna odpowiedź
            userAnswerElement.style.backgroundColor = "green";
            setTimeout(() => {  form.submit(); }, 1500);
        } else if (correctAnswer == ""){
            // ! W przypadku gdy nie ma zadeklarowanej poprawnej odpowiedzi
            userAnswerElement.classList.add("opacity");
            setTimeout(() => {  form.submit(); }, 1500);
        } else {
            // ! W przypadku gdy jest źle
            userAnswerElement.style.backgroundColor = "#820000";
            userAnswerElement.classList.add("opacity");
            correctButton.style.backgroundColor = "green";
            setTimeout(() => {  form.submit(); }, 2000);
        }
    xhr.open("GET", "s_update_question_data.php?answer=" + userAnswer + "&q-id=" + questionId + "&c-answer=" + correctAnswer, true);
    xhr.send();
}
// 課題 JS-3 の実装をここに記述してください。
(function() {
    var submitButton = document.getElementById("submit-button");
    var tableContainer = document.getElementById("table-container");

    submitButton.addEventListener("click", function() {
        tableContainer.textContent = "";
        var text = document.getElementById("log-input").value;
        var parsed = parseLTSVLog(text);
        createLogTable(tableContainer, parsed);
    });
})();

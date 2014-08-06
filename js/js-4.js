// 課題 JS-3 の実装をここに記述してください。
(function() {
    var submitButton = document.getElementById("submit-button");
    var tableContainer = document.getElementById("table-container");
    var searchTextinput = document.getElementById("search-textinput");

    submitButton.addEventListener("click", function() {
        var text = document.getElementById("log-input").value;
        var parsed = parseLTSVLog(text);
        var updateLogTable = function(parsed) {
            tableContainer.textContent = "";
            createLogTable(tableContainer, parsed);
        };
        updateLogTable(parsed);
        searchTextinput.disabled = false;
        
        searchTextinput.addEventListener("keyup", function() {
            updateLogTable(parsed.filter(function(obj) {
                return (obj.path.indexOf(searchTextinput.value) >= 0);
            }));
        });
    });

})();

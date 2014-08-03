// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(logStr) {
    var re = /^([0-9A-Za-z_.-]+):(.+)$/;
    var logArray = logStr.split("\n");
    var rtn = []

    for (var i=0; i < logArray.length; i++) {
        var lineArray = logArray[i].split("\t");
        var obj = {};
        var hasObj = false;
        for (var j=0; j < lineArray.length; j++) {
            var match = lineArray[j].match(re);
            if (!match)
                continue;
            obj[match[1]] = (match[1] === "reqtime_microsec")? Number(match[2], 10) : match[2];
            hasObj = true;
        }
        if (hasObj)
            rtn.push(obj);
    }

    return rtn;
}

// 課題 JS-2: 関数 `createLogTable` を記述してください
function createLogTable(domElem, logArray) {
    var table = document.createElement("table");
    var tbody = document.createElement("tbody");

    table.appendChild((function() {
        var thead = document.createElement("thead");
        thead.appendChild((function() {
            var tr = document.createElement("tr");
            tr.appendChild((function() {
                var th = document.createElement("th");
                th.textContent = "path";
                return th;
            })());
            tr.appendChild((function() {
                var th = document.createElement("th");
                th.textContent = "reqtime_microsec";
                return th;
            })());
            return tr;
        })());
        return thead;
    })());

    for (var i=0; i < logArray.length; i++) {
        var log = logArray[i];

        tbody.appendChild((function() {
            var tr = document.createElement("tr");
            tr.appendChild((function() {
                var td = document.createElement("td");
                td.textContent = log.path;
                return td;
            })());
            tr.appendChild((function() {
                var td = document.createElement("td");
                td.textContent = String(log.reqtime_microsec)
                return td;
            })());
            return tr;
        })());
    }

    table.appendChild(tbody);
    domElem.appendChild(table);
    return domElem;
}

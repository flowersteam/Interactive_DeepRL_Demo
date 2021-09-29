/* Utility functions */

/**
 * Downloads the given object as a JSON file with the given filename.
 * @param exportObj {Object} - Object to be downloaded.
 * @param exportName {string} - Name of the file.
 */
window.downloadObjectAsJson = (exportObj, exportName) => {
    let dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(exportObj));
    let downloadAnchorNode = document.createElement('a');
    downloadAnchorNode.setAttribute("href",     dataStr);
    downloadAnchorNode.setAttribute("download", exportName + ".json");
    document.body.appendChild(downloadAnchorNode); // required for firefox
    downloadAnchorNode.click();
    downloadAnchorNode.remove();
}

/**
 * Transforms the first character of the given string to upper case.
 * @param a {string}
 * @returns {string}
 */
window.strUcFirst = (a) => {
    return (a+'').charAt(0).toUpperCase()+a.substr(1);
}

/**
 * Draws the forbidden area in the off-screen forbidden canvas.
 */
window.draw_forbidden_area = () => {
    forbidden_canvas.clear();
    forbidden_canvas.stroke("#FF0000");
    forbidden_canvas.strokeWeight(3);
    forbidden_canvas.fill(255, 50, 0, 75);
    let w = convertPosEnvToCanvas((INITIAL_TERRAIN_STARTPAD - 1) * TERRAIN_STEP, 0).x;
    forbidden_canvas.rect(0, 0, w, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
}
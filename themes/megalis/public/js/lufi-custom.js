
// When it's ready
$(document).ready(function () {
    if (maxSize > 0) {
        $('#max-file-size-mo').text(i18n.maxSize.replace('XXX', filesize(maxSize, { symbols: { MB: "Mo", GB: "Go" } })));
    }
});

/**
 * Here goes all the main dependencies that are common to the entire website
 */
//= require js/vendor/jquery-3.1.1.min.js
//= require js/vendor/isotope.min.js
//= require js/vendor/lightbox.min.js
//= require js/vendor/clipboard.min.js
//= require js/vendor/scripts.js


/**
 * Here goes Screenly custom scripts
 */

(function($) {

    /**
     * Any script that runs after document is ready
     * @return void
     */
    $(document).ready(function() {

        /**
         * Deal with App url copy to clipboard.
         */
        $('.btn-clipboard').on ('click', function (e){
            e.preventDefault();
        });

        var clipboard = new Clipboard('.btn-clipboard');
        clipboard.on('success', function(e) {
            $(e.trigger)
            .removeClass ('btn--primary')
            .find ('.icon-File-Clipboard')
            .removeClass ('icon-File-Clipboard')
            .addClass ('icon-Yes');
            e.clearSelection();
        });
    });

})(jQuery);

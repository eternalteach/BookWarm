
// Common

/*
Plugin Name: 	BrowserSelector 
Version: 		4.9.2
*/
(function ($) {
   $.extend({

      browserSelector: function () {

         // jQuery.browser.mobile (http://detectmobilebrowser.com/)
         (function (a) { (jQuery.browser = jQuery.browser || {}).mobile = /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4)) })(navigator.userAgent || navigator.vendor || window.opera);

         // Touch
         var hasTouch = 'ontouchstart' in window || navigator.msMaxTouchPoints;

         var u = navigator.userAgent,
            ua = u.toLowerCase(),
            is = function (t) {
               return ua.indexOf(t) > -1;
            },
            g = 'gecko',
            w = 'webkit',
            s = 'safari',
            o = 'opera',
            h = document.documentElement,
            b = [(!(/opera|webtv/i.test(ua)) && /msie\s(\d)/.test(ua)) ? ('ie ie' + parseFloat(navigator.appVersion.split("MSIE")[1])) : is('firefox/2') ? g + ' ff2' : is('firefox/3.5') ? g + ' ff3 ff3_5' : is('firefox/3') ? g + ' ff3' : is('gecko/') ? g : is('opera') ? o + (/version\/(\d+)/.test(ua) ? ' ' + o + RegExp.jQuery1 : (/opera(\s|\/)(\d+)/.test(ua) ? ' ' + o + RegExp.jQuery2 : '')) : is('konqueror') ? 'konqueror' : is('chrome') ? w + ' chrome' : is('iron') ? w + ' iron' : is('applewebkit/') ? w + ' ' + s + (/version\/(\d+)/.test(ua) ? ' ' + s + RegExp.jQuery1 : '') : is('mozilla/') ? g : '', is('j2me') ? 'mobile' : is('iphone') ? 'iphone' : is('ipod') ? 'ipod' : is('mac') ? 'mac' : is('darwin') ? 'mac' : is('webtv') ? 'webtv' : is('win') ? 'win' : is('freebsd') ? 'freebsd' : (is('x11') || is('linux')) ? 'linux' : '', 'js'];

         c = b.join(' ');

         if ($.browser.mobile) {
            c += ' mobile';
         }

         if (hasTouch) {
            c += ' touch';
         }

         h.className += ' ' + c;

         // IE11 Detect
         var isIE11 = !(window.ActiveXObject) && "ActiveXObject" in window;

         if (isIE11) {
            $('html').removeClass('gecko').addClass('ie ie11');
            return;
         }

         // Dark and Boxed Compatibility
         if ($('body').hasClass('dark')) {
            $('html').addClass('dark');
         }

         if ($('body').hasClass('boxed')) {
            $('html').addClass('boxed');
         }

      }

   });

   $.browserSelector();

})(jQuery);

/*
Plugin Name: 	waitForImages
Written by: 	https://github.com/alexanderdickson/waitForImages
*/
; (function (factory) {
   if (typeof define === 'function' && define.amd) {
      // AMD. Register as an anonymous module.
      define(['jquery'], factory);
   } else if (typeof exports === 'object') {
      // CommonJS / nodejs module
      module.exports = factory(require('jquery'));
   } else {
      // Browser globals
      factory(jQuery);
   }
}(function ($) {
   // Namespace all events.
   var eventNamespace = 'waitForImages';

   // CSS properties which contain references to images.
   $.waitForImages = {
      hasImageProperties: [
         'backgroundImage',
         'listStyleImage',
         'borderImage',
         'borderCornerImage',
         'cursor'
      ],
      hasImageAttributes: ['srcset']
   };

   // Custom selector to find all `img` elements with a valid `src` attribute.
   $.expr[':']['has-src'] = function (obj) {
      // Ensure we are dealing with an `img` element with a valid
      // `src` attribute.
      return $(obj).is('img[src][src!=""]');
   };

   // Custom selector to find images which are not already cached by the
   // browser.
   $.expr[':'].uncached = function (obj) {
      // Ensure we are dealing with an `img` element with a valid
      // `src` attribute.
      if (!$(obj).is(':has-src')) {
         return false;
      }

      return !obj.complete;
   };

   $.fn.waitForImages = function () {

      var allImgsLength = 0;
      var allImgsLoaded = 0;
      var deferred = $.Deferred();

      var finishedCallback;
      var eachCallback;
      var waitForAll;

      // Handle options object (if passed).
      if ($.isPlainObject(arguments[0])) {

         waitForAll = arguments[0].waitForAll;
         eachCallback = arguments[0].each;
         finishedCallback = arguments[0].finished;

      } else {

         // Handle if using deferred object and only one param was passed in.
         if (arguments.length === 1 && $.type(arguments[0]) === 'boolean') {
            waitForAll = arguments[0];
         } else {
            finishedCallback = arguments[0];
            eachCallback = arguments[1];
            waitForAll = arguments[2];
         }

      }

      // Handle missing callbacks.
      finishedCallback = finishedCallback || $.noop;
      eachCallback = eachCallback || $.noop;

      // Convert waitForAll to Boolean
      waitForAll = !!waitForAll;

      // Ensure callbacks are functions.
      if (!$.isFunction(finishedCallback) || !$.isFunction(eachCallback)) {
         throw new TypeError('An invalid callback was supplied.');
      }

      this.each(function () {
         // Build a list of all imgs, dependent on what images will
         // be considered.
         var obj = $(this);
         var allImgs = [];
         // CSS properties which may contain an image.
         var hasImgProperties = $.waitForImages.hasImageProperties || [];
         // Element attributes which may contain an image.
         var hasImageAttributes = $.waitForImages.hasImageAttributes || [];
         // To match `url()` references.
         // Spec: http://www.w3.org/TR/CSS2/syndata.html#value-def-uri
         var matchUrl = /url\(\s*(['"]?)(.*?)\1\s*\)/g;

         if (waitForAll) {

            // Get all elements (including the original), as any one of
            // them could have a background image.
            obj.find('*').addBack().each(function () {
               var element = $(this);

               // If an `img` element, add it. But keep iterating in
               // case it has a background image too.
               if (element.is('img:has-src') &&
                  !element.is('[srcset]')) {
                  allImgs.push({
                     src: element.attr('src'),
                     element: element[0]
                  });
               }

               $.each(hasImgProperties, function (i, property) {
                  var propertyValue = element.css(property);
                  var match;

                  // If it doesn't contain this property, skip.
                  if (!propertyValue) {
                     return true;
                  }

                  // Get all url() of this element.
                  while (match = matchUrl.exec(propertyValue)) {
                     allImgs.push({
                        src: match[2],
                        element: element[0]
                     });
                  }
               });

               $.each(hasImageAttributes, function (i, attribute) {
                  var attributeValue = element.attr(attribute);
                  var attributeValues;

                  // If it doesn't contain this property, skip.
                  if (!attributeValue) {
                     return true;
                  }

                  allImgs.push({
                     src: element.attr('src'),
                     srcset: element.attr('srcset'),
                     element: element[0]
                  });
               });
            });
         } else {
            // For images only, the task is simpler.
            obj.find('img:has-src')
               .each(function () {
                  allImgs.push({
                     src: this.src,
                     element: this
                  });
               });
         }

         allImgsLength = allImgs.length;
         allImgsLoaded = 0;

         // If no images found, don't bother.
         if (allImgsLength === 0) {
            finishedCallback.call(obj[0]);
            deferred.resolveWith(obj[0]);
         }

         $.each(allImgs, function (i, img) {

            var image = new Image();
            var events =
               'load.' + eventNamespace + ' error.' + eventNamespace;

            // Handle the image loading and error with the same callback.
            $(image).one(events, function me(event) {
               // If an error occurred with loading the image, set the
               // third argument accordingly.
               var eachArguments = [
                  allImgsLoaded,
                  allImgsLength,
                  event.type == 'load'
               ];
               allImgsLoaded++;

               eachCallback.apply(img.element, eachArguments);
               deferred.notifyWith(img.element, eachArguments);

               // Unbind the event listeners. I use this in addition to
               // `one` as one of those events won't be called (either
               // 'load' or 'error' will be called).
               $(this).off(events, me);

               if (allImgsLoaded == allImgsLength) {
                  finishedCallback.call(obj[0]);
                  deferred.resolveWith(obj[0]);
                  return false;
               }

            });

            if (img.srcset) {
               image.srcset = img.srcset;
            }
            image.src = img.src;
         });
      });

      return deferred.promise();

   };
}));

/*
Plugin Name: 	Count To
Written by: 	Matt Huggins - https://github.com/mhuggins/jquery-countTo
*/
(function ($) {
   $.fn.countTo = function (options) {
      options = options || {};

      return $(this).each(function () {
         // set options for current element
         var settings = $.extend({}, $.fn.countTo.defaults, {
            from: $(this).data('from'),
            to: $(this).data('to'),
            speed: $(this).data('speed'),
            refreshInterval: $(this).data('refresh-interval'),
            decimals: $(this).data('decimals')
         }, options);

         // how many times to update the value, and how much to increment the value on each update
         var loops = Math.ceil(settings.speed / settings.refreshInterval),
            increment = (settings.to - settings.from) / loops;

         // references & variables that will change with each update
         var self = this,
            $self = $(this),
            loopCount = 0,
            value = settings.from,
            data = $self.data('countTo') || {};

         $self.data('countTo', data);

         // if an existing interval can be found, clear it first
         if (data.interval) {
            clearInterval(data.interval);
         }
         data.interval = setInterval(updateTimer, settings.refreshInterval);

         // initialize the element with the starting value
         render(value);

         function updateTimer() {
            value += increment;
            loopCount++;

            render(value);

            if (typeof (settings.onUpdate) == 'function') {
               settings.onUpdate.call(self, value);
            }

            if (loopCount >= loops) {
               // remove the interval
               $self.removeData('countTo');
               clearInterval(data.interval);
               value = settings.to;

               if (typeof (settings.onComplete) == 'function') {
                  settings.onComplete.call(self, value);
               }
            }
         }

         function render(value) {
            var formattedValue = settings.formatter.call(self, value, settings);
            $self.html(formattedValue);
         }
      });
   };

   $.fn.countTo.defaults = {
      from: 0,               // the number the element should start at
      to: 0,                 // the number the element should end at
      speed: 1000,           // how long it should take to count between the target numbers
      refreshInterval: 100,  // how often the element should be updated
      decimals: 0,           // the number of decimal places to show
      formatter: formatter,  // handler for formatting the value before rendering
      onUpdate: null,        // callback method for every time the element is updated
      onComplete: null       // callback method for when the element finishes updating
   };

   function formatter(value, settings) {
      return value.toFixed(settings.decimals);
   }
}(jQuery));

/*
Plugin Name: 	afterResize.js
Written by: 	https://github.com/mcshaman/afterResize.js
Description: 	Simple jQuery plugin designed to emulate an 'after resize' event.
*/
(function ($) {
   "use strict";

   // Define default settings
   var defaults = {
      action: function () { },
      runOnLoad: false,
      duration: 500
   };

   // Define global variables
   var settings = defaults,
      running = false,
      start;

   var methods = {};

   // Initial plugin configuration
   methods.init = function () {

      // Allocate passed arguments to settings based on type
      for (var i = 0; i <= arguments.length; i++) {
         var arg = arguments[i];
         switch (typeof arg) {
            case "function":
               settings.action = arg;
               break;
            case "boolean":
               settings.runOnLoad = arg;
               break;
            case "number":
               settings.duration = arg;
               break;
         }
      }

      // Process each matching jQuery object
      return this.each(function () {

         if (settings.runOnLoad) { settings.action(); }

         $(this).resize(function () {

            methods.timedAction.call(this);

         });

      });
   };

   methods.timedAction = function (code, millisec) {

      var doAction = function () {
         var remaining = settings.duration;

         if (running) {
            var elapse = new Date() - start;
            remaining = settings.duration - elapse;
            if (remaining <= 0) {
               // Clear timeout and reset running variable
               clearTimeout(running);
               running = false;
               // Perform user defined function
               settings.action();

               return;
            }
         }
         wait(remaining);
      };

      var wait = function (time) {
         running = setTimeout(doAction, time);
      };

      // Define new action starting time
      start = new Date();

      // Define runtime settings if function is run directly
      if (typeof millisec === 'number') { settings.duration = millisec; }
      if (typeof code === 'function') { settings.action = code; }

      // Only run timed loop if not already running
      if (!running) { doAction(); }

   };


   $.fn.afterResize = function (method) {

      if (methods[method]) {
         return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
      } else {
         return methods.init.apply(this, arguments);
      }

   };

})(jQuery);

/*
Plugin Name: 	matchHeight 
Version: 		4.9.2
*/
; (function ($) {
	/*
	*  internal
	*/

   var _previousResizeWidth = -1,
      _updateTimeout = -1;

	/*
	*  _rows
	*  utility function returns array of jQuery selections representing each row
	*  (as displayed after float wrapping applied by browser)
	*/

   var _rows = function (elements) {
      var tolerance = 1,
         $elements = $(elements),
         lastTop = null,
         rows = [];

      // group elements by their top position
      $elements.each(function () {
         var $that = $(this),
            top = $that.offset().top - _parse($that.css('margin-top')),
            lastRow = rows.length > 0 ? rows[rows.length - 1] : null;

         if (lastRow === null) {
            // first item on the row, so just push it
            rows.push($that);
         } else {
            // if the row top is the same, add to the row group
            if (Math.floor(Math.abs(lastTop - top)) <= tolerance) {
               rows[rows.length - 1] = lastRow.add($that);
            } else {
               // otherwise start a new row group
               rows.push($that);
            }
         }

         // keep track of the last row top
         lastTop = top;
      });

      return rows;
   };

	/*
	*  _parse
	*  value parse utility function
	*/

   var _parse = function (value) {
      // parse value and convert NaN to 0
      return parseFloat(value) || 0;
   };

	/*
	*  _parseOptions
	*  handle plugin options
	*/

   var _parseOptions = function (options) {
      var opts = {
         byRow: true,
         remove: false,
         property: 'height'
      };

      if (typeof options === 'object') {
         return $.extend(opts, options);
      }

      if (typeof options === 'boolean') {
         opts.byRow = options;
      } else if (options === 'remove') {
         opts.remove = true;
      }

      return opts;
   };

	/*
	*  matchHeight
	*  plugin definition
	*/

   var matchHeight = $.fn.matchHeight = function (options) {
      var opts = _parseOptions(options);

      // handle remove
      if (opts.remove) {
         var that = this;

         // remove fixed height from all selected elements
         this.css(opts.property, '');

         // remove selected elements from all groups
         $.each(matchHeight._groups, function (key, group) {
            group.elements = group.elements.not(that);
         });

         // TODO: cleanup empty groups

         return this;
      }

      if (this.length <= 1)
         return this;

      // keep track of this group so we can re-apply later on load and resize events
      matchHeight._groups.push({
         elements: this,
         options: opts
      });

      // match each element's height to the tallest element in the selection
      matchHeight._apply(this, opts);

      return this;
   };

	/*
	*  plugin global options
	*/

   matchHeight._groups = [];
   matchHeight._throttle = 80;
   matchHeight._maintainScroll = false;
   matchHeight._beforeUpdate = null;
   matchHeight._afterUpdate = null;

	/*
	*  matchHeight._apply
	*  apply matchHeight to given elements
	*/

   matchHeight._apply = function (elements, options) {
      var opts = _parseOptions(options),
         $elements = $(elements),
         rows = [$elements];

      // take note of scroll position
      var scrollTop = $(window).scrollTop(),
         htmlHeight = $('html').outerHeight(true);

      // get hidden parents
      var $hiddenParents = $elements.parents().filter(':hidden');

      // cache the original inline style
      $hiddenParents.each(function () {
         var $that = $(this);
         $that.data('style-cache', $that.attr('style'));
      });

      // temporarily must force hidden parents visible
      $hiddenParents.css('display', 'block');

      // get rows if using byRow, otherwise assume one row
      if (opts.byRow) {

         // must first force an arbitrary equal height so floating elements break evenly
         $elements.each(function () {
            var $that = $(this),
               display = $that.css('display') === 'inline-block' ? 'inline-block' : 'block';

            // cache the original inline style
            $that.data('style-cache', $that.attr('style'));

            $that.css({
               'display': display,
               'padding-top': '0',
               'padding-bottom': '0',
               'margin-top': '0',
               'margin-bottom': '0',
               'border-top-width': '0',
               'border-bottom-width': '0',
               'height': '100px'
            });
         });

         // get the array of rows (based on element top position)
         rows = _rows($elements);

         // revert original inline styles
         $elements.each(function () {
            var $that = $(this);
            $that.attr('style', $that.data('style-cache') || '');
         });
      }

      $.each(rows, function (key, row) {
         var $row = $(row),
            maxHeight = 0;

         // skip apply to rows with only one item
         if (opts.byRow && $row.length <= 1) {
            $row.css(opts.property, '');
            return;
         }

         // iterate the row and find the max height
         $row.each(function () {
            var $that = $(this),
               display = $that.css('display') === 'inline-block' ? 'inline-block' : 'block';

            // ensure we get the correct actual height (and not a previously set height value)
            var css = { 'display': display };
            css[opts.property] = '';
            $that.css(css);

            // find the max height (including padding, but not margin)
            if ($that.outerHeight(false) > maxHeight)
               maxHeight = $that.outerHeight(false);

            // revert display block
            $that.css('display', '');
         });

         // iterate the row and apply the height to all elements
         $row.each(function () {
            var $that = $(this),
               verticalPadding = 0;

            // handle padding and border correctly (required when not using border-box)
            if ($that.css('box-sizing') !== 'border-box') {
               verticalPadding += _parse($that.css('border-top-width')) + _parse($that.css('border-bottom-width'));
               verticalPadding += _parse($that.css('padding-top')) + _parse($that.css('padding-bottom'));
            }

            // set the height (accounting for padding and border)
            $that.css(opts.property, maxHeight - verticalPadding);
         });
      });

      // revert hidden parents
      $hiddenParents.each(function () {
         var $that = $(this);
         $that.attr('style', $that.data('style-cache') || null);
      });

      // restore scroll position if enabled
      if (matchHeight._maintainScroll)
         $(window).scrollTop((scrollTop / htmlHeight) * $('html').outerHeight(true));

      return this;
   };

	/*
	*  matchHeight._applyDataApi
	*  applies matchHeight to all elements with a data-match-height attribute
	*/

   matchHeight._applyDataApi = function () {
      var groups = {};

      // generate groups by their groupId set by elements using data-match-height
      $('[data-match-height], [data-mh]').each(function () {
         var $this = $(this),
            groupId = $this.attr('data-match-height') || $this.attr('data-mh');
         if (groupId in groups) {
            groups[groupId] = groups[groupId].add($this);
         } else {
            groups[groupId] = $this;
         }
      });

      // apply matchHeight to each group
      $.each(groups, function () {
         this.matchHeight(true);
      });
   };

	/*
	*  matchHeight._update
	*  updates matchHeight on all current groups with their correct options
	*/

   var _update = function (event) {
      if (matchHeight._beforeUpdate)
         matchHeight._beforeUpdate(event, matchHeight._groups);

      $.each(matchHeight._groups, function () {
         matchHeight._apply(this.elements, this.options);
      });

      if (matchHeight._afterUpdate)
         matchHeight._afterUpdate(event, matchHeight._groups);
   };

   matchHeight._update = function (throttle, event) {
      // prevent update if fired from a resize event
      // where the viewport width hasn't actually changed
      // fixes an event looping bug in IE8
      if (event && event.type === 'resize') {
         var windowWidth = $(window).width();
         if (windowWidth === _previousResizeWidth)
            return;
         _previousResizeWidth = windowWidth;
      }

      // throttle updates
      if (!throttle) {
         _update(event);
      } else if (_updateTimeout === -1) {
         _updateTimeout = setTimeout(function () {
            _update(event);
            _updateTimeout = -1;
         }, matchHeight._throttle);
      }
   };

	/*
	*  bind events
	*/

   // apply on DOM ready event
   $(matchHeight._applyDataApi);

   // update heights on load and resize events
   $(window).bind('load', function (event) {
      matchHeight._update(false, event);
   });

   // throttled update heights on resize events
   $(window).bind('resize orientationchange', function (event) {
      matchHeight._update(true, event);
   });

})(jQuery);

/*
Plugin Name: 	jQuery.pin 
Version: 		4.9.2
*/
(function ($) {
   "use strict";
   $.fn.pin = function (options) {
      var scrollY = 0, elements = [], disabled = false, $window = $(window);

      options = options || {};

      var recalculateLimits = function () {
         for (var i = 0, len = elements.length; i < len; i++) {
            var $this = elements[i];

            if (options.minWidth && $window.width() <= options.minWidth) {
               if ($this.parent().is(".pin-wrapper")) { $this.unwrap(); }
               $this.css({ width: "", left: "", top: "", position: "" });
               if (options.activeClass) { $this.removeClass(options.activeClass); }
               disabled = true;
               continue;
            } else {
               disabled = false;
            }

            var $container = options.containerSelector ? $this.closest(options.containerSelector) : $(document.body);
            var offset = $this.offset();
            var containerOffset = $container.offset();
            var parentOffset = $this.parent().offset();

            if (!$this.parent().is(".pin-wrapper")) {
               $this.wrap("<div class='pin-wrapper'>");
            }

            var pad = $.extend({
               top: 0,
               bottom: 0
            }, options.padding || {});

            $this.data("pin", {
               pad: pad,
               from: (options.containerSelector ? containerOffset.top : offset.top) - pad.top,
               to: containerOffset.top + $container.height() - $this.outerHeight() - pad.bottom,
               end: containerOffset.top + $container.height(),
               parentTop: parentOffset.top
            });

            $this.css({ width: $this.outerWidth() });
            $this.parent().css("height", $this.outerHeight());
         }
      };

      var onScroll = function () {
         if (disabled) { return; }

         scrollY = $window.scrollTop();

         var elmts = [];
         for (var i = 0, len = elements.length; i < len; i++) {
            var $this = $(elements[i]),
               data = $this.data("pin");

            if (!data) { // Removed element
               continue;
            }

            elmts.push($this);

            var from = data.from - data.pad.bottom,
               to = data.to - data.pad.top;

            if (from + $this.outerHeight() > data.end) {
               $this.css('position', '');
               continue;
            }

            if (from < scrollY && to > scrollY) {
               !($this.css("position") == "fixed") && $this.css({
                  left: $this.offset().left,
                  top: data.pad.top
               }).css("position", "fixed");
               if (options.activeClass) { $this.addClass(options.activeClass); }
            } else if (scrollY >= to) {
               $this.css({
                  left: "",
                  top: to - data.parentTop + data.pad.top
               }).css("position", "absolute");
               if (options.activeClass) { $this.addClass(options.activeClass); }
            } else {
               $this.css({ position: "", top: "", left: "" });
               if (options.activeClass) { $this.removeClass(options.activeClass); }
            }
         }
         elements = elmts;
      };

      var update = function () { recalculateLimits(); onScroll(); };

      this.each(function () {
         var $this = $(this),
            data = $(this).data('pin') || {};

         if (data && data.update) { return; }
         elements.push($this);
         $("img", this).one("load", recalculateLimits);
         data.update = update;
         $(this).data('pin', data);
      });

      $window.scroll(onScroll);
      $window.resize(function () { recalculateLimits(); });
      recalculateLimits();

      $window.on('load', update);

      return this;
   };
})(jQuery);

/*
Browser Workarounds
*/
if (/iPad|iPhone|iPod/.test(navigator.platform)) {

   // iPad/Iphone/iPod Hover Workaround
   $(document).ready(function ($) {
      $('.thumb-info').attr('onclick', 'return true');
   });
}

// End Common =====

 

// Theme
window.theme = {};

// Theme Common Functions
window.theme.fn = {
	getOptions: function(opts) {
		if (typeof(opts) == 'object') {
			return opts;
		} else if (typeof(opts) == 'string') {
			try {
				return JSON.parse(opts.replace(/'/g,'"').replace(';',''));
			} catch(e) {
				return {};
			}
		} else {
			return {};
		}
	}
};

// Menuzord
(function (theme, $) {

   theme = theme || {};

   var instanceName = '__menuzord';

   var PluginMenuzord = function ($el, opts) {
      return this.initialize($el, opts);
   };

   PluginMenuzord.defaults = {
      align: 'right',
      effect: 'fade',
      animation: 'drop-up',
      indicatorFirstLevel: "<i class='fa fa-angle-down'></i>",
      //indicatorFirstLevel: "",
      indicatorSecondLevel: "<i class='fa fa-angle-right'></i>"
   };

   PluginMenuzord.prototype = {
      initialize: function ($el, opts) {
         if ($el.data(instanceName)) {
            return this;
         }

         if (opts.indicator) {
            if (opts.indicator === "style-1") {
               opts.indicatorFirstLevel = "<i class='fa fa-caret-down'></i>";
               opts.indicatorSecondLevel = "<i class='fa fa-caret-right'></i>"
            } else if (opts.indicator === "style-2") {
               opts.indicatorFirstLevel = "<i class='fa fa-angle-down'></i>";
               opts.indicatorSecondLevel = "<i class='fa fa-angle-right'></i>"
            } else if (opts.indicator === "none") {
               opts.indicatorFirstLevel = '';
               opts.indicatorSecondLevel = "<i class='fa fa-caret-right'></i>"
            }
         } 
          
         this.$el = $el;

         this
            .setData()
            .setOptions(opts)
            .build()
            .events();

         return this;
      },

      setData: function () {
         this.$el.data(instanceName, this);

         return this;
      },

      setOptions: function (opts) {
         this.options = $.extend(true, {}, PluginMenuzord.defaults, opts, {
            wrapper: this.$el
         });

         return this;
      },

      build: function () {
         if (!($.isFunction($.fn.menuzord))) {
            return this;
         }

         this.options.wrapper.menuzord(this.options);

         return this;
      },

      events: function () {
         return this;
      }
   };

   // expose to scope
   $.extend(theme, {
      PluginMenuzord: PluginMenuzord
   });

   // jquery plugin
   $.fn.themePluginMenuzord = function (opts) {
      return this.map(function () {
         var $this = $(this);

         if ($this.data(instanceName)) {
            return $this.data(instanceName);
         } else {
            return new PluginMenuzord($this, opts); 
         }

      });
   }

}).apply(this, [window.theme, jQuery]);

// Animate
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__animate';

	var PluginAnimate = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginAnimate.defaults = {
		accX: 0,
		accY: -150,
		delay: 1,
		duration: '1s'
	};

	PluginAnimate.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginAnimate.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			var self = this,
				$el = this.options.wrapper,
				delay = 0,
				duration = '1s';

			$el.addClass('appear-animation animated');

			if (!$('html').hasClass('no-csstransitions') && $(window).width() > 767) {

				$el.appear(function() {

					$el.one('animation:show', function(ev) {
						delay = ($el.attr('data-appear-animation-delay') ? $el.attr('data-appear-animation-delay') : self.options.delay);
						duration = ($el.attr('data-appear-animation-duration') ? $el.attr('data-appear-animation-duration') : self.options.duration);

						if (duration != '1s') {
							$el.css('animation-duration', duration);
						}

						setTimeout(function() {
							$el.addClass($el.attr('data-appear-animation') + ' appear-animation-visible');
						}, delay);
					});

					$el.trigger('animation:show');

				}, {
					accX: self.options.accX,
					accY: self.options.accY
				});

			} else {

				$el.addClass('appear-animation-visible');

			}

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginAnimate: PluginAnimate
	});

	// jquery plugin
	$.fn.themePluginAnimate = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginAnimate($this, opts);
			}

		});
	};

}).apply(this, [window.theme, jQuery]);

// Carousel
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__carousel';

	var PluginCarousel = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginCarousel.defaults = {
		loop: true,
		responsive: { 
		},
		navText: []
	};

	PluginCarousel.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginCarousel.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.owlCarousel))) {
				return this;
			}

			var self = this,
				$el = this.options.wrapper;

			// Add Theme Class
			$el.addClass('owl-theme');

			// Force RTL according to HTML dir attribute
			if ($('html').attr('dir') == 'rtl') {
				this.options = $.extend(true, {}, this.options, {
					rtl: true
				});
			}

			if (this.options.items == 1) {
				this.options.responsive = {}
			}

			if (this.options.items > 4) {
				this.options = $.extend(true, {}, this.options, {
					responsive: {
						1199: {
							items: this.options.items
						}
					}
				});
			}

			// Auto Height Fixes
			if (this.options.autoHeight) {
				var itemsHeight = [];

				$el.find('.owl-item').each(function(){
					if( $(this).hasClass('active') ) {
						itemsHeight.push( $(this).height() );
					}
				});

				$(window).afterResize(function() {
					$el.find('.owl-stage-outer').height( Math.max.apply(null, itemsHeight) );
				});

				$(window).on('load', function() {
					$el.find('.owl-stage-outer').height( Math.max.apply(null, itemsHeight) );
				});
			}

			// Initialize OwlCarousel
			$el.owlCarousel(this.options).addClass('owl-carousel-init');

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginCarousel: PluginCarousel
	});

	// jquery plugin
	$.fn.themePluginCarousel = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginCarousel($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Chart Circular
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__chartCircular';

	var PluginChartCircular = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginChartCircular.defaults = {
		accX: 0,
		accY: -150,
		delay: 1,
		barColor: '#0088CC',
		trackColor: '#f2f2f2',
		scaleColor: false,
		scaleLength: 5,
		lineCap: 'round',
		lineWidth: 13,
		size: 175,
		rotate: 0,
		animate: ({
			duration: 2500,
			enabled: true
		})
	};

	PluginChartCircular.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginChartCircular.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.appear)) || !($.isFunction($.fn.easyPieChart))) {
				return this;
			}

			var self = this,
				$el = this.options.wrapper,
				value = ($el.attr('data-percent') ? $el.attr('data-percent') : 0),
				percentEl = $el.find('.percent');

			$.extend(true, self.options, {
				onStep: function(from, to, currentValue) {
					percentEl.html(parseInt(currentValue));
				}
			});

			$el.attr('data-percent', 0);

			$el.appear(function() {

				$el.easyPieChart(self.options);

				setTimeout(function() {

					$el.data('easyPieChart').update(value);
					$el.attr('data-percent', value);

				}, self.options.delay);

			}, {
				accX: self.options.accX,
				accY: self.options.accY
			});

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginChartCircular: PluginChartCircular
	});

	// jquery plugin
	$.fn.themePluginChartCircular = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginChartCircular($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Counter
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__counter';

	var PluginCounter = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginCounter.defaults = {
		accX: 0,
		accY: 0,
		speed: 3000,
		refreshInterval: 100,
		decimals: 0,
		onUpdate: null,
		onComplete: null
	};

	PluginCounter.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginCounter.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.countTo))) {
				return this;
			}

			var self = this,
				$el = this.options.wrapper;

			$.extend(self.options, {
				onComplete: function() {
					if ($el.data('append')) {
						$el.html($el.html() + $el.data('append'));
					}

					if ($el.data('prepend')) {
						$el.html($el.data('prepend') + $el.html());
					}
				}
			});

			$el.appear(function() {

				$el.countTo(self.options);

			}, {
				accX: self.options.accX,
				accY: self.options.accY
			});

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginCounter: PluginCounter
	});

	// jquery plugin
	$.fn.themePluginCounter = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginCounter($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Lazy Load
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__lazyload';

	var PluginLazyLoad = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginLazyLoad.defaults = {
		effect: 'show',
		appearEffect: '',
		appear: function(elements_left, settings) {
			
		},
		load: function(elements_left, settings) {
			$(this).addClass($.trim('lazy-load-loaded ' + settings.appearEffect));
		}
	};

	PluginLazyLoad.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginLazyLoad.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.lazyload))) {
				return this;
			}

			var self = this;

			self.options.wrapper.lazyload(this.options);

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginLazyLoad: PluginLazyLoad
	});

	// jquery plugin
	$.fn.themePluginLazyLoad = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginLazyLoad($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Lightbox
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__lightbox';

	var PluginLightbox = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginLightbox.defaults = {
		tClose: 'Close (Esc)', // Alt text on close button
		tLoading: 'Loading...', // Text that is displayed during loading. Can contain %curr% and %total% keys
		gallery: {
			tPrev: 'Previous (Left arrow key)', // Alt text on left arrow
			tNext: 'Next (Right arrow key)', // Alt text on right arrow
			tCounter: '%curr% of %total%' // Markup for "1 of 7" counter
		},
		image: {
			tError: '<a href="%url%">The image</a> could not be loaded.' // Error message when image could not be loaded
		},
		ajax: {
			tError: '<a href="%url%">The content</a> could not be loaded.' // Error message when ajax request failed
		},
		callbacks: {
			open: function() {
				$('html').addClass('lightbox-opened');
			},
			close: function() {
				$('html').removeClass('lightbox-opened');
			}
		}
	};

	PluginLightbox.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginLightbox.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.magnificPopup))) {
				return this;
			}

			this.options.wrapper.magnificPopup(this.options);

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginLightbox: PluginLightbox
	});

	// jquery plugin
	$.fn.themePluginLightbox = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginLightbox($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Loading Overlay
(function(theme, $) {

	'use strict';

	theme = theme || {};

	var loadingOverlayTemplate = [
		'<div class="loading-overlay">',
			'<div class="bounce-loader"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>',
		'</div>'
	].join('');

	var LoadingOverlay = function( $wrapper, options ) {
		return this.initialize( $wrapper, options );
	};

	LoadingOverlay.prototype = {

		options: {
			css: {}
		},

		initialize: function( $wrapper, options ) {
			this.$wrapper = $wrapper;

			this
				.setVars()
				.setOptions( options )
				.build()
				.events();

			this.$wrapper.data( 'loadingOverlay', this );
		},

		setVars: function() {
			this.$overlay = this.$wrapper.find('.loading-overlay');

			return this;
		},

		setOptions: function( options ) {
			if ( !this.$overlay.get(0) ) {
				this.matchProperties();
			}
			this.options     = $.extend( true, {}, this.options, options );
			this.loaderClass = this.getLoaderClass( this.options.css.backgroundColor );

			return this;
		},

		build: function() {
			if ( !this.$overlay.closest(document.documentElement).get(0) ) {
				if ( !this.$cachedOverlay ) {
					this.$overlay = $( loadingOverlayTemplate ).clone();

					if ( this.options.css ) {
						this.$overlay.css( this.options.css );
						this.$overlay.find( '.loader' ).addClass( this.loaderClass );
					}
				} else {
					this.$overlay = this.$cachedOverlay.clone();
				}

				this.$wrapper.append( this.$overlay );
			}

			if ( !this.$cachedOverlay ) {
				this.$cachedOverlay = this.$overlay.clone();
			}

			return this;
		},

		events: function() {
			var _self = this;

			if ( this.options.startShowing ) {
				_self.show();
			}

			if ( this.$wrapper.is('body') || this.options.hideOnWindowLoad ) {
				$( window ).on( 'load error', function() {
					_self.hide();
				});
			}

			if ( this.options.listenOn ) {
				$( this.options.listenOn )
					.on( 'loading-overlay:show beforeSend.ic', function( e ) {
						e.stopPropagation();
						_self.show();
					})
					.on( 'loading-overlay:hide complete.ic', function( e ) {
						e.stopPropagation();
						_self.hide();
					});
			}

			this.$wrapper
				.on( 'loading-overlay:show beforeSend.ic', function( e ) {
					if ( e.target === _self.$wrapper.get(0) ) {
						e.stopPropagation();
						_self.show();
						return true;
					}
					return false;
				})
				.on( 'loading-overlay:hide complete.ic', function( e ) {
					if ( e.target === _self.$wrapper.get(0) ) {
						e.stopPropagation();
						_self.hide();
						return true;
					}
					return false;
				});

			return this;
		},

		show: function() {
			this.build();

			this.position = this.$wrapper.css( 'position' ).toLowerCase();
			if ( this.position != 'relative' || this.position != 'absolute' || this.position != 'fixed' ) {
				this.$wrapper.css({
					position: 'relative'
				});
			}
			this.$wrapper.addClass( 'loading-overlay-showing' );
		},

		hide: function() {
			var _self = this;

			this.$wrapper.removeClass( 'loading-overlay-showing' );
			setTimeout(function() {
				if ( this.position != 'relative' || this.position != 'absolute' || this.position != 'fixed' ) {
					_self.$wrapper.css({ position: '' });
				}
			}, 500);
		},

		matchProperties: function() {
			var i,
				l,
				properties;

			properties = [
				'backgroundColor',
				'borderRadius'
			];

			l = properties.length;

			for( i = 0; i < l; i++ ) {
				var obj = {};
				obj[ properties[ i ] ] = this.$wrapper.css( properties[ i ] );

				$.extend( this.options.css, obj );
			}
		},

		getLoaderClass: function( backgroundColor ) {
			if ( !backgroundColor || backgroundColor === 'transparent' || backgroundColor === 'inherit' ) {
				return 'black';
			}

			var hexColor,
				r,
				g,
				b,
				yiq;

			var colorToHex = function( color ){
				var hex,
					rgb;

				if( color.indexOf('#') >- 1 ){
					hex = color.replace('#', '');
				} else {
					rgb = color.match(/\d+/g);
					hex = ('0' + parseInt(rgb[0], 10).toString(16)).slice(-2) + ('0' + parseInt(rgb[1], 10).toString(16)).slice(-2) + ('0' + parseInt(rgb[2], 10).toString(16)).slice(-2);
				}

				if ( hex.length === 3 ) {
					hex = hex + hex;
				}

				return hex;
			};

			hexColor = colorToHex( backgroundColor );

			r = parseInt( hexColor.substr( 0, 2), 16 );
			g = parseInt( hexColor.substr( 2, 2), 16 );
			b = parseInt( hexColor.substr( 4, 2), 16 );
			yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;

			return ( yiq >= 128 ) ? 'black' : 'white';
		}

	};

	// expose to scope
	$.extend(theme, {
		LoadingOverlay: LoadingOverlay
	});

	// expose as a jquery plugin
	$.fn.loadingOverlay = function( opts ) {
		return this.each(function() {
			var $this = $( this );

			var loadingOverlay = $this.data( 'loadingOverlay' );
			if ( loadingOverlay ) {
				return loadingOverlay;
			} else {
				var options = opts || $this.data( 'loading-overlay-options' ) || {};
				return new LoadingOverlay( $this, options );
			}
		});
	}

	// auto init
	$('[data-loading-overlay]').loadingOverlay();

}).apply(this, [window.theme, jQuery]);

// Masonry
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__masonry';

	var PluginMasonry = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginMasonry.defaults = {
		itemSelector: 'li'
	};

	PluginMasonry.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginMasonry.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.isotope))) {
				return this;
			}

			var self = this,
				$window = $(window);

			self.$loader = false;

			if (self.options.wrapper.parents('.masonry-loader').get(0)) {
				self.$loader = self.options.wrapper.parents('.masonry-loader');
				self.createLoader();
			}

			self.options.wrapper.one('layoutComplete', function(event, laidOutItems) {
				self.removeLoader();
			});

			self.options.wrapper.waitForImages(function() {
				self.options.wrapper.isotope(this.options);
			});

			setTimeout(function() {
				self.removeLoader();
			}, 3000);

			return this;
		},

		createLoader: function() {
			var self = this;

			var loaderTemplate = [
				'<div class="bounce-loader">',
					'<div class="bounce1"></div>',
					'<div class="bounce2"></div>',
					'<div class="bounce3"></div>',
				'</div>'
			].join('');

			self.$loader.append(loaderTemplate);

			return this;
		},

		removeLoader: function() {

			var self = this;

			if (self.$loader) {

				self.$loader.removeClass('masonry-loader-showing');

				setTimeout(function() {
					self.$loader.addClass('masonry-loader-loaded');
				}, 300);

			}

		}
	};

	// expose to scope
	$.extend(theme, {
		PluginMasonry: PluginMasonry
	});

	// jquery plugin
	$.fn.themePluginMasonry = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginMasonry($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Match Height
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__matchHeight';

	var PluginMatchHeight = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginMatchHeight.defaults = {
		byRow: true,
		property: 'height',
		target: null,
		remove: false
	};

	PluginMatchHeight.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginMatchHeight.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.matchHeight))) {
				return this;
			}

			var self = this;

			self.options.wrapper.matchHeight(self.options);

			return this;
		}

	};

	// expose to scope
	$.extend(theme, {
		PluginMatchHeight: PluginMatchHeight
	});

	// jquery plugin
	$.fn.themePluginMatchHeight = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginMatchHeight($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Parallax
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__parallax';

	var PluginParallax = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginParallax.defaults = {
		speed: 1.5,
		horizontalPosition: '50%',
		offset: 0
	};

	PluginParallax.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginParallax.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			var self = this,
				$window = $(window),
				offset,
				yPos,
				bgpos,
				background;

			// Create Parallax Element
			background = $('<div class="parallax-background"></div>');

			// Set Style for Parallax Element
			background.css({
				'background-image' : 'url(' + self.options.wrapper.data('image-src') + ')',
				'background-size' : 'cover',
				'position' : 'absolute',
				'top' : 0,
				'left' : 0,
				'width' : '100%',
				'height' : '180%'
			});

			// Add Parallax Element on DOM
			self.options.wrapper.prepend(background);

			// Set Overlfow Hidden and Position Relative to Parallax Wrapper
			self.options.wrapper.css({
				'position' : 'relative',
				'overflow' : 'hidden'
			});

			// Parallax Effect on Scroll & Resize
			var parallaxEffectOnScrolResize = function() {
				$window.on('scroll resize', function() {
					offset  = self.options.wrapper.offset();
					yPos    = -($window.scrollTop() - (offset.top - 100)) / ((self.options.speed + 2 ) + (self.options.offset));
					plxPos  = (yPos < 0) ? Math.abs(yPos) : -Math.abs(yPos);
					background.css({
						'transform' : 'translate3d(0, '+ plxPos +'px, 0)',
						'background-position-x' : self.options.horizontalPosition
					});
				});

				$window.trigger('scroll');
			}

			if (!$.browser.mobile) {
				parallaxEffectOnScrolResize();
			} else {
				if( self.options.enableOnMobile == true ) {
					parallaxEffectOnScrolResize();
				} else {
					self.options.wrapper.addClass('parallax-disabled');
				}
			}

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginParallax: PluginParallax
	});

	// jquery plugin
	$.fn.themePluginParallax = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginParallax($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Revolution Slider
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__revolution';

	var PluginRevolutionSlider = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginRevolutionSlider.defaults = {
		sliderType: 'standard',
		sliderLayout: 'fullwidth',
		delay: 9000,
		gridwidth: 1170,
		gridheight: 500,
		spinner: 'spinner3',
		disableProgressBar: 'on',
		parallax: {
			type: 'off',
			bgparallax: 'off'
		},
		navigation: {
			keyboardNavigation: 'off',
			keyboard_direction: 'horizontal',
			mouseScrollNavigation: 'off',
			onHoverStop: 'off',
			touch: {
				touchenabled: 'on',
				swipe_threshold: 75,
				swipe_min_touches: 1,
				swipe_direction: 'horizontal',
				drag_block_vertical: false
			},
			arrows: {
				enable: true,
				hide_onmobile: false,
				hide_under: 0,
				hide_onleave: true,
				hide_delay: 200,
				hide_delay_mobile: 1200,
				left: {
					h_align: 'left',
					v_align: 'center',
					h_offset: 30,
					v_offset: 0
				},
				right: {
					h_align: 'right',
					v_align: 'center',
					h_offset: 30,
					v_offset: 0
				}
			}
		}
	};

	PluginRevolutionSlider.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build()
				.events();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginRevolutionSlider.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.revolution))) {
				return this;
			}

			// Single Slider Class
			if(this.options.wrapper.find('> ul > li').length == 1) {
				this.options.wrapper.addClass('slider-single-slide');
			}

			this.options.wrapper.revolution(this.options);

			return this;
		},

		events: function() {

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginRevolutionSlider: PluginRevolutionSlider
	});

	// jquery plugin
	$.fn.themePluginRevolutionSlider = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginRevolutionSlider($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Sort
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__sort';

	var PluginSort = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginSort.defaults = {
		useHash: true,
		itemSelector: '.isotope-item',
		layoutMode: 'masonry',
		filter: '*',
		hiddenStyle: {
			opacity: 0
		},
		visibleStyle: {
			opacity: 1
		},
		stagger: 30,
		isOriginLeft: ($('html').attr('dir') == 'rtl' ? false : true)
	};

	PluginSort.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginSort.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.isotope))) {
				return this;
			}

			var self = this,
				$source = this.options.wrapper,
				$destination = $('.sort-destination[data-sort-id="' + $source.attr('data-sort-id') + '"]'),
				$window = $(window);

			if ($destination.get(0)) {

				self.$source = $source;
				self.$destination = $destination;
				self.$loader = false;

				self.setParagraphHeight($destination);

				if (self.$destination.parents('.sort-destination-loader').get(0)) {
					self.$loader = self.$destination.parents('.sort-destination-loader');
					self.createLoader();
				}

				$destination.attr('data-filter', '*');

				$destination.one('layoutComplete', function(event, laidOutItems) {
					self.removeLoader();
				});

				$destination.waitForImages(function() {
					$destination.isotope(self.options);
					self.events();
				});

				setTimeout(function() {
					self.removeLoader();
				}, 3000);

			}

			return this;
		},

		events: function() {
			var self = this,
				filter = null,
				$window = $(window);

			self.$source.find('a').click(function(e) {
				e.preventDefault();

				filter = $(this).parent().data('option-value');

				self.setFilter(filter);

				if (e.originalEvent) {
					self.$source.trigger('filtered');
				}

				return this;
			});

			self.$destination.trigger('filtered');
			self.$source.trigger('filtered');

			if (self.options.useHash) {
				self.hashEvents();
			}

			$window.on('resize', function() {
				setTimeout(function() {
					self.$destination.isotope('layout');
				}, 300);
			});

			setTimeout(function() {
				$window.trigger('resize');
			}, 300);

			return this;
		},

		setFilter: function(filter) {
			var self = this,
				page = false,
				currentFilter = filter;

			self.$source.find('li.active').removeClass('active');
			self.$source.find('li[data-option-value="' + filter + '"]').addClass('active');

			self.options.filter = currentFilter;

			if (self.$destination.attr('data-current-page')) {
				currentFilter = currentFilter + '[data-page-rel=' + self.$destination.attr('data-current-page') + ']';
			}

			self.$destination.attr('data-filter', filter).isotope({
				filter: currentFilter
			}).one('arrangeComplete', function( event, filteredItems ) {
				
				if (self.options.useHash) {
					if (window.location.hash != '' || self.options.filter.replace('.', '') != '*') {
						window.location.hash = self.options.filter.replace('.', '');
					}
				}
				
				$(window).trigger('scroll');

			}).trigger('filtered');

			return this;
		},

		hashEvents: function() {
			var self = this,
				hash = null,
				hashFilter = null,
				initHashFilter = '.' + location.hash.replace('#', '');

			if (initHashFilter != '.' && initHashFilter != '.*') {
				self.setFilter(initHashFilter);
			}

			$(window).on('hashchange', function(e) {

				hashFilter = '.' + location.hash.replace('#', '');
				hash = (hashFilter == '.' || hashFilter == '.*' ? '*' : hashFilter);

				self.setFilter(hash);

			});

			return this;
		},

		setParagraphHeight: function() {
			var self = this,
				minParagraphHeight = 0,
				paragraphs = $('span.thumb-info-caption p', self.$destination);

			paragraphs.each(function() {
				if ($(this).height() > minParagraphHeight) {
					minParagraphHeight = ($(this).height() + 10);
				}
			});

			paragraphs.height(minParagraphHeight);

			return this;
		},

		createLoader: function() {
			var self = this;

			var loaderTemplate = [
				'<div class="bounce-loader">',
					'<div class="bounce1"></div>',
					'<div class="bounce2"></div>',
					'<div class="bounce3"></div>',
				'</div>'
			].join('');

			self.$loader.append(loaderTemplate);

			return this;
		},

		removeLoader: function() {

			var self = this;

			if (self.$loader) {

				self.$loader.removeClass('sort-destination-loader-showing');

				setTimeout(function() {
					self.$loader.addClass('sort-destination-loader-loaded');
				}, 300);

			}

		}

	};

	// expose to scope
	$.extend(theme, {
		PluginSort: PluginSort
	});

	// jquery plugin
	$.fn.themePluginSort = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginSort($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Sticky
(function(theme, $) {
	
	theme = theme || {};
	
	var instanceName = '__sticky';

	var PluginSticky = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginSticky.defaults = {
		minWidth: 991,
		activeClass: 'sticky-active'
	};

	PluginSticky.prototype = {
		initialize: function($el, opts) {
			if ( $el.data( instanceName ) ) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginSticky.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (!($.isFunction($.fn.pin))) {
				return this;
			}

			var self = this,
				$window = $(window);
			
			self.options.wrapper.pin(self.options);

			$window.afterResize(function() {
				self.options.wrapper.removeAttr('style').removeData('pin');
				self.options.wrapper.pin(self.options);
				$window.trigger('scroll');
			});
			
			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginSticky: PluginSticky
	});

	// jquery plugin
	$.fn.themePluginSticky = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginSticky($this, opts);
			}
			
		});
	}

}).apply(this, [ window.theme, jQuery ]);

// Toggle
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__toggle';

	var PluginToggle = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginToggle.defaults = {
		duration: 350,
		isAccordion: false
	};

	PluginToggle.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginToggle.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			var self = this,
				$wrapper = this.options.wrapper,
				$items = $wrapper.find('.toggle'),
				$el = null;

			$items.each(function() {
				$el = $(this);

				if ($el.hasClass('active')) {
					$el.find('> p').addClass('preview-active');
					$el.find('> .toggle-content').slideDown(self.options.duration);
				}

				self.events($el);
			});

			if (self.options.isAccordion) {
				self.options.duration = self.options.duration / 2;
			}

			return this;
		},

		events: function($el) {
			var self = this,
				previewParCurrentHeight = 0,
				previewParAnimateHeight = 0,
				toggleContent = null;

			$el.find('> label').click(function(e) {

				var $this = $(this),
					parentSection = $this.parent(),
					parentWrapper = $this.parents('.toggle'),
					previewPar = null,
					closeElement = null;

				if (self.options.isAccordion && typeof(e.originalEvent) != 'undefined') {
					closeElement = parentWrapper.find('.toggle.active > label');

					if (closeElement[0] == $this[0]) {
						return;
					}
				}

				parentSection.toggleClass('active');

				// Preview Paragraph
				if (parentSection.find('> p').get(0)) {

					previewPar = parentSection.find('> p');
					previewParCurrentHeight = previewPar.css('height');
					previewPar.css('height', 'auto');
					previewParAnimateHeight = previewPar.css('height');
					previewPar.css('height', previewParCurrentHeight);

				}

				// Content
				toggleContent = parentSection.find('> .toggle-content');

				if (parentSection.hasClass('active')) {

					$(previewPar).animate({
						height: previewParAnimateHeight
					}, self.options.duration, function() {
						$(this).addClass('preview-active');
					});

					toggleContent.slideDown(self.options.duration, function() {
						if (closeElement) {
							closeElement.trigger('click');
						}
					});

				} else {

					$(previewPar).animate({
						height: 0
					}, self.options.duration, function() {
						$(this).removeClass('preview-active');
					});

					toggleContent.slideUp(self.options.duration);

				}

			});
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginToggle: PluginToggle
	});

	// jquery plugin
	$.fn.themePluginToggle = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginToggle($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Tweets
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__tweets';

	var PluginTweets = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginTweets.defaults = {
		username: null,
		count: 2,
		URL: 'php/twitter-feed.php'
	};

	PluginTweets.prototype = {
		initialize: function($el, opts) {
			if ($el.data(instanceName)) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginTweets.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			if (this.options.username == null || this.options.username == '') {
				return this;
			}

			var self = this,
				$wrapper = this.options.wrapper;

			$.ajax({
				type: 'GET',
				data: {
					twitter_screen_name: self.options.username,
					tweets_to_display: self.options.count
				},
				url: self.options.URL,
			}).done(function(html) {
				$wrapper.html(html).find('a').attr('target','_blank');
			});

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginTweets: PluginTweets
	});

	// jquery plugin
	$.fn.themePluginTweets = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginTweets($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Validation
(function(theme, $) {

	theme = theme || {};

	$.extend(theme, {

		PluginValidation: {

			defaults: {
				validator: {
					highlight: function(element) {
						$(element)
							.parent()
							.removeClass('has-success')
							.addClass('has-error');
					},
					success: function(element) {
						$(element)
							.parent()
							.removeClass('has-error')
							.addClass('has-success')
							.find('label.error')
							.remove();
					},
					errorPlacement: function(error, element) {
						if (element.attr('type') == 'radio' || element.attr('type') == 'checkbox') {
							error.appendTo(element.parent().parent());
						} else {
							error.insertAfter(element);
						}
					}
				},
				validateCaptchaURL: 'php/contact-form-verify-captcha.php',
				refreshCaptchaURL: 'php/contact-form-refresh-captcha.php'
			},

			initialize: function(opts) {
				initialized = true;

				this
					.setOptions(opts)
					.build();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts);

				return this;
			},

			build: function() {
				var self = this;

				if (!($.isFunction($.validator))) {
					return this;
				}

				self.addMethods();
				self.setMessageGroups();

				$.validator.setDefaults(self.options.validator);

				return this;
			},

			addMethods: function() {
				var self = this;

				$.validator.addMethod('captcha', function(value, element, params) {
					var captchaValid = false;

					$.ajax({
						url: self.options.validateCaptchaURL,
						type: 'POST',
						async: false,
						dataType: 'json',
						data: {
							captcha: $.trim(value)
						},
						success: function(data) {
							if (data.response == 'success') {
								captchaValid = true;
							}
						}
					});

					if (captchaValid) {
						return true;
					}

				}, '');

				// Refresh Captcha
				$('#refreshCaptcha').on('click', function(e) {
					e.preventDefault();
					$.get(self.options.refreshCaptchaURL, function(url) {
						$('#captcha-image').attr('src', url);
					});					
				});

			},

			setMessageGroups: function() {

				$('.checkbox-group[data-msg-required], .radio-group[data-msg-required]').each(function() {
					var message = $(this).data('msg-required');
					$(this).find('input').attr('data-msg-required', message);
				});

			}

		}

	});

}).apply(this, [window.theme, jQuery]);

// Video Background
(function(theme, $) {

	theme = theme || {};

	var instanceName = '__videobackground';

	var PluginVideoBackground = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginVideoBackground.defaults = {
		overlay: true,
		volume: 1,
		playbackRate: 1,
		muted: true,
		loop: true,
		autoplay: true,
		position: '50% 50%',
		posterType: 'detect'
	};

	PluginVideoBackground.prototype = {
		initialize: function($el, opts) {
			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginVideoBackground.defaults, opts, {
				path: this.$el.data('video-path'),
				wrapper: this.$el
			});

			return this;
		},

		build: function() {

			if (!($.isFunction($.fn.vide)) || (!this.options.path)) {
				return this;
			}

			if (this.options.overlay) {
				this.options.wrapper.prepend(
					$('<div />').addClass('video-overlay')
				);
			}

			this.options.wrapper.vide(this.options.path, this.options);

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginVideoBackground: PluginVideoBackground
	});

	// jquery plugin
	$.fn.themePluginVideoBackground = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginVideoBackground($this, opts);
			}

		});
	}

}).apply(this, [window.theme, jQuery]);

// Word Rotate
(function(theme, $) {
	
	theme = theme || {};
	
	var instanceName = '__wordRotate';

	var PluginWordRotate = function($el, opts) {
		return this.initialize($el, opts);
	};

	PluginWordRotate.defaults = {
		delay: 2000,
		animDelay: 300
	};

	PluginWordRotate.prototype = {
		initialize: function($el, opts) {
			if ( $el.data( instanceName ) ) {
				return this;
			}

			this.$el = $el;

			this
				.setData()
				.setOptions(opts)
				.build();

			return this;
		},

		setData: function() {
			this.$el.data(instanceName, this);

			return this;
		},

		setOptions: function(opts) {
			this.options = $.extend(true, {}, PluginWordRotate.defaults, opts, {
				wrapper: this.$el
			});

			return this;
		},

		build: function() {
			var self = this,
				$el = this.options.wrapper,
				itemsWrapper = $el.find(".word-rotate-items"),
				items = itemsWrapper.find("> span"),
				firstItem = items.eq(0),
				firstItemClone = firstItem.clone(),
				currentItem = 1,
				currentTop = 0,
				itemWidth = 0;

			itemsWrapper
				.width(firstItem.width() + "px")
				.append(firstItemClone);

			$el				
				.addClass("active");

			setInterval(function() {

				currentTop = (currentItem * $el.height());
				currentItem++;

				if(currentItem <= items.length) {
					itemWidth = items.eq(currentItem-1).width();
				} else {
					itemWidth = items.eq(0).width();
				}

				itemsWrapper.animate({
					top: -(currentTop) + "px",
					width: itemWidth + "px"
				}, self.options.animDelay, "easeOutQuad", function() {

					if(currentItem > items.length) {

						itemsWrapper.css("top", 0);
						currentItem = 1;

					}

				});

			}, self.options.delay);

			return this;
		}
	};

	// expose to scope
	$.extend(theme, {
		PluginWordRotate: PluginWordRotate
	});

	// jquery plugin
	$.fn.themePluginWordRotate = function(opts) {
		return this.map(function() {
			var $this = $(this);

			if ($this.data(instanceName)) {
				return $this.data(instanceName);
			} else {
				return new PluginWordRotate($this, opts);
			}
			
		});
	}

}).apply(this, [ window.theme, jQuery ]);

// Account
(function(theme, $) {

	theme = theme || {};

	var initialized = false;

	$.extend(theme, {

		Account: {

			defaults: {
				wrapper: $('#headerAccount')
			},

			initialize: function($wrapper, opts) {
				if (initialized) {
					return this;
				}

				initialized = true;
				this.$wrapper = ($wrapper || this.defaults.wrapper);

				this
					.setOptions(opts)
					.events();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts, theme.fn.getOptions(this.$wrapper.data('plugin-options')));

				return this;
			},

			events: function() {
				var self = this;

				self.$wrapper.find('input').on('focus', function() {
					self.$wrapper.addClass('open');

					$(document).mouseup(function(e) {
						if (!self.$wrapper.is(e.target) && self.$wrapper.has(e.target).length === 0) {
							self.$wrapper.removeClass('open');
						}
					});
				});

				$('#headerSignUp').on('click', function(e) {
					e.preventDefault();
					self.$wrapper.addClass('signup').removeClass('signin').removeClass('recover');
					self.$wrapper.find('.signup-form input:first').focus();
				});

				$('#headerSignIn').on('click', function(e) {
					e.preventDefault();
					self.$wrapper.addClass('signin').removeClass('signup').removeClass('recover');
					self.$wrapper.find('.signin-form input:first').focus();
				});

				$('#headerRecover').on('click', function(e) {
					e.preventDefault();
					self.$wrapper.addClass('recover').removeClass('signup').removeClass('signin');
					self.$wrapper.find('.recover-form input:first').focus();
				});

				$('#headerRecoverCancel').on('click', function(e) {
					e.preventDefault();
					self.$wrapper.addClass('signin').removeClass('signup').removeClass('recover');
					self.$wrapper.find('.signin-form input:first').focus();
				});
			}

		}

	});

}).apply(this, [window.theme, jQuery]);

// Nav
(function(theme, $) {

	theme = theme || {};

	var initialized = false;

	$.extend(theme, {

		Nav: {

			defaults: {
				wrapper: $('#mainNav'),
				scrollDelay: 600,
				scrollAnimation: 'easeOutQuad'
			},

			initialize: function($wrapper, opts) {
				if (initialized) {
					return this;
				}

				initialized = true;
				this.$wrapper = ($wrapper || this.defaults.wrapper);

				this
					.setOptions(opts)
					.build()
					.events();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts, theme.fn.getOptions(this.$wrapper.data('plugin-options')));

				return this;
			},

			build: function() {
				var self = this,
					$html = $('html'),
					$header = $('#header'),
					thumbInfoPreview;

				// Add Arrows
				$header.find('.dropdown-toggle, .dropdown-submenu > a').append($('<i />').addClass('fa fa-caret-down'));

				// Preview Thumbs
				self.$wrapper.find('a[data-thumb-preview]').each(function() {
					thumbInfoPreview = $('<span />').addClass('thumb-info thumb-info-preview')
											.append($('<span />').addClass('thumb-info-wrapper')
												.append($('<span />').addClass('thumb-info-image').css('background-image', 'url(' + $(this).data('thumb-preview') + ')')
										   )
									   );

					$(this).append(thumbInfoPreview);
				});

				// Side Header Right (Reverse Dropdown)
				if($html.hasClass('side-header-right')) {
					$header.find('.dropdown').addClass('dropdown-reverse');
				}

				// Reverse
				self.checkReverse = function() {

               self.$wrapper.find('.dropdown-menu').removeClass('dropdown-reverse');

               self.$wrapper.find('.dropdown-submenu:not(.manual)').each(function () {
                  if (!$(this).find('.dropdown-menu').visible(false, true, 'horizontal')) {
                     $(this).find('.dropdown-menu').addClass('dropdown-reverse');
                  }
               });
				}

				self.checkReverse();

 				$(window).afterResize(function() {
					self.checkReverse();
 				});

				return this;
			},

			events: function() {
				var self    = this,
					$html   = $('html'),
					$header = $('#header'),
					$window = $(window);

				$header.find('a[href="#"]').on('click', function(e) {
					e.preventDefault();
				});

				// Mobile Arrows
				$header.find('.dropdown-toggle[href="#"], .dropdown-submenu a[href="#"], .dropdown-toggle[href!="#"] .fa-caret-down, .dropdown-submenu a[href!="#"] .fa-caret-down').on('click', function(e) {
					e.preventDefault();
					if ($window.width() < 992) {
						$(this).closest('li').toggleClass('opened');
					}
				});

				// Touch Devices with normal resolutions
				if('ontouchstart' in document.documentElement) {
					$header.find('.dropdown-toggle:not([href="#"]), .dropdown-submenu > a:not([href="#"])')
						.on('touchstart click', function(e) {
							if($window.width() > 991) {

								e.stopPropagation();
								e.preventDefault();

								if(e.handled !== true) {

									var li = $(this).closest('li');

									if(li.hasClass('tapped')) {
										location.href = $(this).attr('href');
									}

									li.addClass('tapped');

									e.handled = true;
								} else {
									return false;
								}

								return false;

							}
						})
						.on('blur', function(e) {
							$(this).closest('li').removeClass('tapped');
						});

				}

				// Collapse Nav
				$header.find('[data-collapse-nav]').on('click', function(e) {
					$(this).parents('.collapse').removeClass('in');
				});

				// Anchors Position
				$('[data-hash]').each(function() {

					var target = $(this).attr('href'),
						offset = ($(this).is("[data-hash-offset]") ? $(this).data('hash-offset') : 0);

					if($(target).get(0)) {
						$(this).on('click', function(e) {
							e.preventDefault();

							// Close Collapse if Opened
							$(this).parents('.collapse.in').removeClass('in');

							self.scrollToTarget(target, offset);

							return;
						});
					}

				});

				// Flex header
 				var isIE9        = $html.hasClass('ie9'),
 					isHeaderFlex = $header.hasClass('header-flex')
 					isEdge       = /Edge/.test(navigator.userAgent);
 
 				if( isIE9 && isHeaderFlex && $window.width() > 991 ) {
 					headerNavHeight = 

 					$header.find('.header-nav').css({
 						height: ( $header.find('.header-top').get(0) ) ? ( $header.find('.header-body').height() - $header.find('.header-top').outerHeight() ) + 4 : $header.find('.header-body').height()
 					});
 
 					$header.find('.header-nav-main nav > ul > li > a').css({
 						'line-height': $('.header-nav-main nav > ul > li > a').height() + 'px'
 					});
 
 					$header.find('.header-nav .header-social-icons').css({
 						'line-height': $header.find('.header-nav').height() + 'px'
 					});
 				}

 				if( isEdge ) {
 					$('#header.header-flex .header-nav-main nav > ul > li.dropdown .dropdown-menu').css({
 						'margin-top' : '-1px'
 					});
 				}

				return this;
			},

			scrollToTarget: function(target, offset) {
				var self = this;

				$('body').addClass('scrolling');

				$('html, body').animate({
					scrollTop: $(target).offset().top - offset
				}, self.options.scrollDelay, self.options.scrollAnimation, function() {
					$('body').removeClass('scrolling');
				});

				return this;

			}

		}

	});

}).apply(this, [window.theme, jQuery]);

// Newsletter
(function(theme, $) {

	theme = theme || {};

	var initialized = false;

	$.extend(theme, {

		Newsletter: {

			defaults: {
				wrapper: $('#newsletterForm')
			},

			initialize: function($wrapper, opts) {
				if (initialized) {
					return this;
				}

				initialized = true;
				this.$wrapper = ($wrapper || this.defaults.wrapper);

				this
					.setOptions(opts)
					.build();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts, theme.fn.getOptions(this.$wrapper.data('plugin-options')));

				return this;
			},

			build: function() {
				if (!($.isFunction($.fn.validate))) {
					return this;
				}

				var self = this,
					$email = self.$wrapper.find('#newsletterEmail'),
					$success = $('#newsletterSuccess'),
					$error = $('#newsletterError');

				self.$wrapper.validate({
					submitHandler: function(form) {

						$.ajax({
							type: 'POST',
							url: self.$wrapper.attr('action'),
							data: {
								'email': $email.val()
							},
							dataType: 'json',
							success: function(data) {
								if (data.response == 'success') {

									$success.removeClass('hidden');
									$error.addClass('hidden');

									$email
										.val('')
										.blur()
										.closest('.control-group')
										.removeClass('success')
										.removeClass('error');

								} else {

									$error.html(data.message);
									$error.removeClass('hidden');
									$success.addClass('hidden');

									$email
										.blur()
										.closest('.control-group')
										.removeClass('success')
										.addClass('error');

								}
							}
						});

					},
					rules: {
						newsletterEmail: {
							required: true,
							email: true
						}
					},
					errorPlacement: function(error, element) {

					}
				});

				return this;
			}

		}

	});

}).apply(this, [window.theme, jQuery]);

// Search
(function(theme, $) {

	theme = theme || {};

	var initialized = false;

	$.extend(theme, {

		Search: {

			defaults: {
				wrapper: $('#searchForm')
			},

			initialize: function($wrapper, opts) {
				if (initialized) {
					return this;
				}

				initialized = true;
				this.$wrapper = ($wrapper || this.defaults.wrapper);

				this
					.setOptions(opts)
					.build();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts, theme.fn.getOptions(this.$wrapper.data('plugin-options')));

				return this;
			},

			build: function() {
				if (!($.isFunction($.fn.validate))) {
					return this;
				}

				this.$wrapper.validate({
					errorPlacement: function(error, element) {}
				});

				return this;
			}

		}

	});

}).apply(this, [window.theme, jQuery]);

// Sticky Header
(function(theme, $) {

	theme = theme || {};

	var initialized = false;

	$.extend(theme, {

		StickyHeader: {

			defaults: {
				wrapper: $('#header'),
				headerBody: $('#header .header-body'),
				stickyEnabled: true,
				stickyEnableOnBoxed: true,
				stickyEnableOnMobile: true,
				stickyStartAt: 0,
				stickyStartAtElement: false,
				stickySetTop: 0,
				stickyChangeLogo: false,
				stickyChangeLogoWrapper: true
			},

			initialize: function($wrapper, opts) {
				if (initialized) {
					return this;
				}

				initialized = true;
				this.$wrapper = ($wrapper || this.defaults.wrapper);

				this
					.setOptions(opts)
					.build()
					.events();

				return this;
			},

			setOptions: function(opts) {
				this.options = $.extend(true, {}, this.defaults, opts, theme.fn.getOptions(this.$wrapper.data('plugin-options')));

				return this;
			},

			build: function() {
				if (!this.options.stickyEnableOnBoxed && $('html').hasClass('boxed') || !this.options.stickyEnabled) {
					return this;
				}

				var self = this,
					$html = $('html'),
					$window = $(window),
					sideHeader = $html.hasClass('side-header');

				// HTML Classes
				$html.addClass('sticky-header-enabled');

				if (parseInt(self.options.stickySetTop) < 0) {
					$html.addClass('sticky-header-negative');
				}

				// Set Start At
				if(self.options.stickyStartAtElement) {

					var $stickyStartAtElement = $(self.options.stickyStartAtElement);

					$(window).on('scroll resize', function() {
						self.options.stickyStartAt = $stickyStartAtElement.offset().top;
					});

					$(window).trigger('resize');
				}

				// Boxed
				if($html.hasClass('boxed') && (parseInt(self.options.stickyStartAt) == 0) && $window.width() > 991) {
					self.options.stickyStartAt = 30;
				}

				// Set Wrapper Min-Height
				self.options.wrapper.css('min-height', self.options.wrapper.height());

				// Check Sticky Header
				self.checkStickyHeader = function() {
					if ($window.scrollTop() >= parseInt(self.options.stickyStartAt)) {
						self.activateStickyHeader();
					} else {
						self.deactivateStickyHeader();
					}
				};
				
				// Activate Sticky Header
				self.activateStickyHeader = function() {

					if ($window.width() < 992) {
						if (!self.options.stickyEnableOnMobile) {
							self.deactivateStickyHeader();
							return;
						}
					} else {
						if (sideHeader) {
							self.deactivateStickyHeader();
							return;
						}
					}

					$html.addClass('sticky-header-active');

					self.options.headerBody.css('top', self.options.stickySetTop);

					if (self.options.stickyChangeLogo) {
						self.changeLogo(true);
					}

					$.event.trigger({
						type: 'stickyHeader.activate'
					});
				};

				// Deactivate Sticky Header
				self.deactivateStickyHeader = function() {

					$html.removeClass('sticky-header-active');

					self.options.headerBody.css('top', 0);

					if (self.options.stickyChangeLogo) {
						self.changeLogo(false);
					}

					$.event.trigger({
						type: 'stickyHeader.deactivate'
					});
				};

				// Always Sticky
				if (parseInt(self.options.stickyStartAt) <= 0) {
					self.activateStickyHeader();
				}

				// Set Logo
				if (self.options.stickyChangeLogo) {

					var $logoWrapper = self.options.wrapper.find('.header-logo'),
						$logo = $logoWrapper.find('img'),
						logoWidth = $logo.attr('width'),
						logoHeight = $logo.attr('height'),
						logoSmallTop = parseInt($logo.attr('data-sticky-top') ? $logo.attr('data-sticky-top') : 0),
						logoSmallWidth = parseInt($logo.attr('data-sticky-width') ? $logo.attr('data-sticky-width') : 'auto'),
						logoSmallHeight = parseInt($logo.attr('data-sticky-height') ? $logo.attr('data-sticky-height') : 'auto');

					if (self.options.stickyChangeLogoWrapper) {
						$logoWrapper.css({
							'width': $logo.outerWidth(true),
							'height': $logo.outerHeight(true)
						});
					}

					self.changeLogo = function(activate) {
						if(activate) {
							$logo.css({
								'top': logoSmallTop,
								'width': logoSmallWidth,
								'height': logoSmallHeight
							});
						} else {
							$logo.css({
								'top': 0,
								'width': logoWidth,
								'height': logoHeight
							});
						}
					}

				}

				return this;
			},

			events: function() {
				var self = this;

				if (!this.options.stickyEnableOnBoxed && $('body').hasClass('boxed') || !this.options.stickyEnabled) {
					return this;
				}

				if (!self.options.alwaysStickyEnabled) {
					$(window).on('scroll resize', function() {
						self.checkStickyHeader();
					});
				} else {
					self.activateStickyHeader();
				}

				return this;
			}

		}

	});

}).apply(this, [window.theme, jQuery]);








// Commom Plugins
(function($) {

	'use strict';

	// Scroll to Top Button.
	if (typeof theme.PluginScrollToTop !== 'undefined') {
		theme.PluginScrollToTop.initialize();
	}

	// Tooltips
	if ($.isFunction($.fn['tooltip'])) {
		$('[data-tooltip]:not(.manual), [data-plugin-tooltip]:not(.manual)').tooltip();
	}

	// Popover
	if ($.isFunction($.fn['popover'])) {
		$(function() {
			$('[data-plugin-popover]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.popover(opts);
			});
		});
	}

	// Validations
	if (typeof theme.PluginValidation !== 'undefined') {
		theme.PluginValidation.initialize();
	}

	// Match Height
	if ($.isFunction($.fn['matchHeight'])) {

		$('.match-height').matchHeight();

		// Featured Boxes
		$('.featured-boxes .featured-box').matchHeight();

		// Featured Box Full
		$('.featured-box-full').matchHeight();

	}

}).apply(this, [jQuery]);

// Menuzord
(function ($) {

   'use strict';

   if ($.isFunction($.fn['themePluginMenuzord'])) {

      $(function () {
         $('[data-plugin-menuzord]').each(function () {
            var $this = $(this),
               opts;

            var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
            if (pluginOptions)
               opts = pluginOptions;

            $this.themePluginMenuzord(opts);
         });
      });

   }

}).apply(this, [jQuery]);

// Animate
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginAnimate'])) {

		$(function() {
			$('[data-appear-animation]').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginAnimate(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Carousel
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginCarousel'])) {

		$(function() {
			$('[data-plugin-carousel]:not(.manual), .owl-carousel:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginCarousel(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Chart.Circular
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginChartCircular'])) {

		$(function() {
			$('[data-plugin-chart-circular]:not(.manual), .circular-bar-chart:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginChartCircular(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Counter
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginCounter'])) {

		$(function() {
			$('[data-plugin-counter]:not(.manual), .counters [data-to]').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginCounter(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Lazy Load
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginLazyLoad'])) {

		$(function() {
			$('[data-plugin-lazyload]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginLazyLoad(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Lightbox
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginLightbox'])) {

		$(function() {
			$('[data-plugin-lightbox]:not(.manual), .lightbox:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginLightbox(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Masonry
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginMasonry'])) {

		$(function() {
			$('[data-plugin-masonry]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMasonry(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Match Height
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginMatchHeight'])) {

		$(function() {
			$('[data-plugin-match-height]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMatchHeight(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Parallax
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginParallax'])) {

		$(function() {
			$('[data-plugin-parallax]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginParallax(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Revolution Slider
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginRevolutionSlider'])) {

		$(function() {
			$('[data-plugin-revolution-slider]:not(.manual), .slider-container .slider:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginRevolutionSlider(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Sort
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginSort'])) {

		$(function() {
			$('[data-plugin-sort]:not(.manual), .sort-source:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginSort(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Sticky
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginSticky'])) {

		$(function() {
			$('[data-plugin-sticky]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginSticky(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Toggle
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginToggle'])) {

		$(function() {
			$('[data-plugin-toggle]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginToggle(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Tweets
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginTweets'])) {

		$(function() {
			$('[data-plugin-tweets]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginTweets(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Video Background
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginVideoBackground'])) {

		$(function() {
			$('[data-plugin-video-background]:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginVideoBackground(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Word Rotate
(function($) {

	'use strict';

	if ($.isFunction($.fn['themePluginWordRotate'])) {

		$(function() {
			$('[data-plugin-word-rotate]:not(.manual), .word-rotate:not(.manual)').each(function() {
				var $this = $(this),
					opts;

				var pluginOptions = theme.fn.getOptions($this.data('plugin-options'));
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginWordRotate(opts);
			});
		});

	}

}).apply(this, [jQuery]);

// Commom Partials
(function($) {

	'use strict';

	// Sticky Header
	if (typeof theme.StickyHeader !== 'undefined') {
		theme.StickyHeader.initialize();
	}

	// Nav Menu
	if (typeof theme.Nav !== 'undefined') {
		theme.Nav.initialize();
	}

	// Search
	if (typeof theme.Search !== 'undefined') {
		theme.Search.initialize();
	}

	// Newsletter
	if (typeof theme.Newsletter !== 'undefined') {
		theme.Newsletter.initialize();
	}

	// Account
	if (typeof theme.Account !== 'undefined') {
		theme.Account.initialize();
	}

}).apply(this, [jQuery]);















jQuery(function ($) {
   "use strict";

   var $window, $document, $body;

   $window = $(window);
   $document = $(document);
   $body = $("body");

   /*==============================================
    Wow init
    ===============================================*/
   if (typeof WOW == "function")
      new WOW().init();


   $window.load(function () {
      $('.lift-off').on('click', function (e) {
         e.preventDefault();
         $('body,html').animate({ scrollTop: 0 }, 800, 'easeOutCubic');
      });
   });

   $document.ready(function () {
      $(".nav-list.tree li").click(function () {
         $(".nav-list.tree li").removeClass("current");
         $(this).addClass("current");
      });

      $(function () {
         $('[data-toggle="popover"]').popover()
      })

      $(function () {
         $('[data-toggle="tooltip"]').tooltip()
      })


      function v_ProgressBar() {
         $("[data-appear-progress-animation]").each(function () {
            var $this = $(this);

            $this.appear(function () {
               var delay = ($this.attr("data-appear-animation-delay") ? $this.attr("data-appear-animation-delay") : 1);

               if (delay > 1) $this.css("animation-delay", delay + "ms");
               $this.addClass($this.attr("data-appear-animation"));

               setTimeout(function () {
                  $this.animate({
                     width: $this.attr("data-appear-progress-animation")
                  }, 1500, "easeOutQuad", function () {
                     $this.find(".progress-bar-tooltip").animate({
                        opacity: 1
                     }, 500, "easeOutQuad");
                  });
               }, delay);
            }, { accX: 0, accY: -50 });
         });
      }
      v_ProgressBar();


      function v_FancyHeading() {
         if (jQuery('.v-fancy-heading').hasClass('v-fancy-image')) {
            $window.stellar();
         }
         setTimeout(function () {
            jQuery('.v-fancy-heading').slideDown({
               duration: 600,
               easing: "easeInOutQuart"
            });
         }, 200);
      }
      v_FancyHeading();



      function v_AnimateCharts () {
         jQuery('.xcircle-chart').each(function () {
            jQuery(this).easyPieChart({
               animate: 1000,
               lineCap: 'round',
               lineWidth: jQuery(this).attr('data-linewidth'),
               size: jQuery(this).attr('data-size'),
               barColor: jQuery(this).attr('data-barcolor'),
               trackColor: jQuery(this).attr('data-trackcolor'),
               scaleColor: 'transparent'
            });
         });

         jQuery('.xcircle-chart').each(function () {
            var chart = jQuery(this);
            chart.appear(function () {
               if (!jQuery(this).hasClass('animated')) {
                  jQuery(this).addClass('animated');
                  var animatePercentage = parseInt(jQuery(this).attr('data-animatepercent'), 10);
                  jQuery(this).data('easyPieChart').update(animatePercentage);
               }
            });
         });
      }
      v_AnimateCharts();


      /*==============================================
       Magnific Popup
       ===============================================*/
      function setMagnificPopup() {
         var magnific_photo = $(".magnific-photo");
         var magnific_gallery = $(".magnific-gallery");
         var magnific_iframe = $(".magnific-iframe");
         var magnific_inline = $(".magnific-inline");
         var magnific_ajax = $(".magnific-ajax");
         if (magnific_photo.length) {
            magnific_photo.magnificPopup({
               type: "image"
            });
         }
         if (magnific_gallery.length) {
            magnific_gallery.each(function () {
               $(this).magnificPopup({
                  delegate: "a",
                  type: "image",
                  gallery: {
                     enabled: true
                  }
               });
            });
         }
         if (magnific_iframe.length) {
            magnific_iframe.magnificPopup({
               type: "iframe"
            });
         }
         if (magnific_inline.length) {
            magnific_inline.magnificPopup({
               type: "inline"
            });
         }
         if (magnific_ajax.length) {
            magnific_ajax.magnificPopup({
               type: "ajax"
            });
         }
      }
      setMagnificPopup();


      /*==============================================
       Animations
       ===============================================*/
      function setAnimations_() {
         jQuery('.exp-animation').each(function () {
            var animatedItem = jQuery(this),
               itemAnimation = animatedItem.data('animation'),
               itemDelay = animatedItem.data('delay'); 

            animatedItem.appear(function () {
               setTimeout(function () {
                  animatedItem.addClass(itemAnimation).css({ 'opacity': 1, 'visibility': 'visible'});
               }, itemDelay);
            });
         });
      }
      setAnimations_();


      /*==============================================
       Sticky nav
       ===============================================*/
      function initSticky() {
         var $navbarSticky, navbarHeight, $brandLogo, $brandLogoImg, centerLogoNormalHeight, centerLogoStickyHeight;
         $navbarSticky = $(".js-navbar-sticky").not(".l-navbar_s-left");
         navbarHeight = $navbarSticky.height();
         $brandLogo = $(".logo-brand");
         $brandLogoImg = $(".logo-brand img");
         centerLogoNormalHeight = 100;
         centerLogoStickyHeight = 60;

         if ($navbarSticky.hasClass("l-navbar_s-center")) {
            $brandLogo.height(centerLogoNormalHeight);
         }

         $navbarSticky.sticky({
            className: "l-navbar-wrapper_has-sticky",
            wrapperClassName: "l-navbar-wrapper",
            zIndex: 10000,
            bottomSpacing: 100
         }).on("sticky-start", function () {
            if ($navbarSticky.hasClass("l-navbar_s-center")) {
               $brandLogo.height(0);
               setTimeout(function () {
                  $brandLogo.addClass("sticky-fix").height(centerLogoStickyHeight);
               }, 300);
            }
            if ($brandLogoImg.attr('data-sticky-logo') !== undefined) {
               $brandLogoImg.attr('src', $brandLogoImg.attr('data-sticky-logo'));
            } 
         }).on("sticky-end", function () {
            $navbarSticky.parent().height(navbarHeight);
            if ($navbarSticky.hasClass("l-navbar_s-center")) {
               $brandLogo.removeClass("sticky-fix").height(centerLogoNormalHeight);
            }

            if ($brandLogoImg.attr('data-logo') !== undefined) {
               $brandLogoImg.attr('src', $brandLogoImg.attr('data-logo'));
            } 
         });
      }
      initSticky();


      /*==============================================
       Magnific popup init
       ===============================================*/
      $(".popup-link").magnificPopup({
         type: "image" 
      });

      $(".popup-youtube, .popup-vimeo, .popup-gmaps, .magnific-iframe").magnificPopup({
         disableOn: 700,
         type: "iframe",
         mainClass: "mfp-fade",
         removalDelay: 160,
         preloader: false,
         fixedContentPos: false
      });



      //Counter
      function v_Counter() {
         jQuery('.v-counter').each(function () {

            var countAsset = jQuery(this),
               countNumber = countAsset.find('.count-number'),
               countDivider = countAsset.find('.count-divider').find('span'),
               countSubject = countAsset.find('.v-counter-text');
            
               countAsset.appear(function () {

                  countNumber.countTo({
                     onComplete: function () {
                        countDivider.animate({
                           'width': 50
                        }, 400, 'easeOutCubic');
                        countSubject.delay(100).animate({
                           'opacity': 1,
                           'bottom': '0px'
                        }, 600, 'easeOutCubic');
                     }
                  });

               }, { accX: 0, accY: -150 }, 'easeInCubic');
            

         });
      }
      v_Counter();









      function ___Parallax() {

         var isMobileAlt = navigator.userAgent.toLowerCase().match(/(iphone|ipod|ipad|android|iemobile)/);

         jQuery('.v-parallax').each(function () {

            var parallaxAsset = jQuery(this);

            if (parallaxAsset.hasClass('v-parallax-video'))

               if (!isMobileAlt) {

                  var parallaxVideo = parallaxAsset.find('video'),
                     parallaxContent = parallaxAsset.find('.v-content-wrapper'),
                     parallaxVideoTop = 0;

                  parallaxVideo.css('top', -parallaxVideoTop);
                  parallaxVideo.attr('data-top-default', parallaxVideoTop);

                  if (parallaxAsset.hasClass('parallax-video-height')) {
                     parallaxAsset.animate({
                        'height': parallaxVideo.height() / 2
                     }, 400);
                     setTimeout(function () {
                        parallaxAsset.find('.video-overlay').animate({
                           'opacity': 0.8
                        }, 200);
                     }, 100);
                     parallaxContent.vCenterTop();
                     setTimeout(function () {
                        parallaxContent.animate({
                           'opacity': 1,
                           'top': '50%'
                        }, 600, 'easeOutExpo');
                     }, 600);
                     parallaxAsset.attr('data-height-default', parallaxVideo.height() / 2);
                     $window.smartresize(function () {
                        parallaxAsset.animate({
                           height: parallaxVideo.height() / 2
                        }, 400);
                        parallaxVideo.css('top', -parallaxVideo.height() / 4);
                        parallaxVideo.attr('data-top-default', parallaxVideo.height() / 4);
                        parallaxAsset.attr('data-height-default', parallaxVideo.height() / 2);
                     });
                  }

                  $window.scroll(function () {
                     if ($window.width() > 1024) {
                        __videoScroll(parallaxAsset);
                     }
                  });
               } else {
                  parallaxAsset.find('video').remove();
               }
         });
      }

      function __videoScroll(asset) {
         var offsetTop = asset.offset().top,
            windowTop = $window.scrollTop(),
            defaultHeight = parseInt(asset.data('height-default'), 10),
            diff = windowTop - offsetTop,
            currentTop = asset.find('.v-content-wrapper').css('top'),
            heightDifference = defaultHeight - diff * 1.5;

         if (windowTop > offsetTop) {
            asset.css('height', heightDifference);
            asset.find('.v-content-wrapper').css('opacity', 1 - (diff / 300));
            if (asset.hasClass('parallax-video-height')) {
               asset.find('.v-content-wrapper').css('top', currentTop + (diff / 4));
            } else {
               asset.find('.v-content-wrapper').css('top', (diff / 3));
            }
         } else {
            asset.css('height', defaultHeight);
            asset.find('.v-content-wrapper').css('opacity', 1);
            if (asset.hasClass('parallax-video-height')) {
               asset.find('.v-content-wrapper').css('top', '50%');
            } else {
               asset.find('.v-content-wrapper').css('top', 0);
            }
         }
      }


      ___Parallax();












      function setFitvids() {
         var fitvids_objects = $(".fitvids");
         if (fitvids_objects.length) {
            fitvids_objects.fitVids();
         }
      }

      setFitvids();

       

      function constellation() {
         var color = 'rgba(255, 255, 255, .8)',
            distance = 120;

         if ($(window).width() < 700) {
            distance = 25;
         }

         $('.constellation').each(function () {

            if ('dark' == $(this).data('color')) {
               color = 'rgba(0, 0, 0, .5)';
            }

            $(this).constellation({
               distance: distance,
               star: {
                  color: color,
                  width: 1
               },
               line: {
                  color: color,
                  width: 0.2
               }
            });
         });

      }

      constellation();


      function typed() {

         $('[data-type]').each(function () {
            var el = $(this);
            var strings = el.data('type').split(',');
            var options = {
               strings: strings,
               typeSpeed: 50,
               backDelay: 800,
               loop: true
            }

            options = $.extend(options, getDataOptions(el));

            //el.typed(options);
         });
      }

      typed();
      

      $("div.carousel-wrap").each(function () {
         var slider = $(this);

         slider.find(".customNavigation .next").click(function () {
            slider.find("div.owl-carousel:not(.manual)").trigger('next.owl.carousel');
         })
         slider.find(".customNavigation .prev").click(function () {
            slider.find("div.owl-carousel:not(.manual)").trigger('prev.owl.carousel');
         })
      });







      // Convert data-attributes options to Javascript object
      //
      function getDataOptions (el, castList) {
         var options = {};

         $.each($(el).data(), function (key, value) {

            key = dataToOption(key);

            // Escape data-provide
            if (key == 'provide') {
               return;
            }

            if (castList != undefined) {
               var type = castList[key];
               switch (type) {
                  case 'bool':
                     value = Boolean(value);
                     break;

                  case 'num':
                     value = Number(value);
                     break;

                  case 'array':
                     value = value.split(',');
                     break;

                  default:

               }
            }

            options[key] = value;
         });

         return options;
      }


      // Convert fooBarBaz to foo-bar-baz
      //
      function optionToData(name) {
         return name.replace(/([A-Z])/g, "-$1").toLowerCase();
      }


      // Convert foo-bar-baz to fooBarBaz
      //
      function dataToOption(name) {
         return name.replace(/-([a-z])/g, function (x) { return x[1].toUpperCase(); });
      }


      








      jQuery('.animate-top').on('click', function (e) {
         e.preventDefault();
         jQuery('body,html').animate({ scrollTop: 0 }, 800, 'easeOutCubic');
      });














      $(".lite-tooltip").LiteTooltip();

       


      /*==============================================
       Back to top init
       ===============================================*/
      $body.append("<a data-scroll class='lift-off js-lift-off lift-off_hide' href='#'><i class='fa fa-angle-up'></i></a>");

      var $liftOff = $(".js-lift-off");
      $window.on("scroll", function () {
         if ($window.scrollTop() > 150) {
            $liftOff.addClass("lift-off_show").removeClass("lift-off_hide");
         } else {
            $liftOff.addClass("lift-off_hide").removeClass("lift-off_show");
         }
      });

   });

});



jQuery(function ($) {
   "use strict";






   //region Google Map
   if ($.fn.gMap) {
      $('.xgoogle-map').each(function () {
         var $map = $(this),
            markers = [],
            type = $map.data('mapType') || 'roadmap',
            zoom = $map.data('mapZoom') || 14,
            style = $map.data('mapStyle') || [],
            scrollwheel = $map.data('mapScrollWheel') || 0,
            markerImg = $map.data('mapMarker') || '',
            markerImgSize = $map.data('mapMarkerSize') || [],
            markerAnchor = $map.data('mapMarkerAnchor') || [];

         if (markerImg) {

            if (markerImgSize.length > 1) {
               markerImgSize = markerImgSize.split(',');
               markerImgSize[0] = parseInt(markerImgSize[0], 10);
               markerImgSize[1] = parseInt(markerImgSize[1], 10);
            }

            if (markerAnchor.length > 1) {
               markerAnchor = markerAnchor.split(',');
               markerAnchor[0] = parseInt(markerAnchor[0], 10);
               markerAnchor[1] = parseInt(markerAnchor[1], 10);
            }

         }

         function buildMarkers() {

            var data = $map.data(),
               dataArray = [],
               addresses = [],
               titles = [],
               coords = [];

            for (var prop in data) {
               if (data.hasOwnProperty(prop)) {
                  dataArray[prop] = data[prop];
               }
            }

            for (var prop2 in dataArray) {
               if (dataArray.hasOwnProperty(prop2)) {
                  if (prop2.indexOf('mapAddress') >= 0) {
                     addresses.push(dataArray[prop2]);
                  } else if (prop2.indexOf('mapCoords') >= 0) {
                     var c = dataArray[prop2].split(';');
                     if (c.length > 1) {
                        coords.push({
                           latitude: c[0],
                           longitude: c[1]
                        });
                     }
                  } else if (prop2.indexOf('mapTitle') >= 0) {
                     titles.push(dataArray[prop2]);
                  }
               }
            }

            for (var i = addresses.length - 1; i >= 0; i--) {
               var marker = {
                  address: addresses[i] ? addresses[i] : '',
                  title: titles[i] ? titles[i] : ''
               };

               if (markerImg) {
                  marker.icon = {
                     image: markerImg,
                     iconsize: markerImgSize,
                     iconanchor: markerAnchor
                  };
               }

               markers.push(marker);
            }

            for (var j = coords.length - 1; j >= 0; j--) {
               var marker2 = {
                  latitude: coords[j] ? coords[j].latitude : '',
                  longitude: coords[j] ? coords[j].longitude : '',
                  title: titles[j] ? titles[j] : ''
               };

               if (markerImg) {
                  marker2.icon = {
                     image: markerImg,
                     iconsize: markerImgSize,
                     iconanchor: markerAnchor
                  };
               }

               markers.push(marker2);
            }

         }

         buildMarkers();

         if (style && window['googleMapStyle_' + style] && window['googleMapStyle_' + style].length) {
            style = window['googleMapStyle_' + style];
         }


         if (markers[0].address) {
            $map.gMap({
               maptype: type,
               address: markers[0].address,
               zoom: zoom,
               styles: style,
               scrollwheel: scrollwheel,
               markers: markers
            });
         } else if (markers[0].latitude) {
            $map.gMap({
               maptype: type,
               latitude: markers[0].latitude,
               longitude: markers[0].longitude,
               zoom: zoom,
               styles: style,
               scrollwheel: scrollwheel,
               markers: markers
            });
         }

      });
   }
	//endregion

 




   //region Revolution Slider
   if ($.fn.revolution) {
      $('.pi-revolution-slider').revolution({
         delay: 9000,
         startwidth: 1130,
         startheight: 500,
         hideThumbs: 10,
         fullWidth: "on",
         forceFullWidth: "off",
         hideTimerBar: "on"
      });

      $('.pi-revolution-slider-fullscreen').revolution({
         delay: 9000,
         startwidth: 1130,
         startheight: 500,
         hideThumbs: 10,
         fullScreen: "on",
         hideTimerBar: "on"
      });

      $('.pi-revolution-slider-fullscreen-offset-header').revolution({
         delay: 9000,
         startwidth: 1130,
         startheight: 500,
         hideThumbs: 10,
         fullScreen: "on",
         hideTimerBar: "on",
         fullScreenOffsetContainer: ".pi-header"
      });
   }
   //endregion
























   $('label.tree-toggler').click(function () {
      $(this).parent().children('ul.tree').toggle(300);
   });




   var multisidetabs = (function () {
      var opt, parentid,
         vars = {
            listsub: '.list-sub',
            showclass: 'mg-show'
         },
         test = function () {
            console.log(parentid);
         },
         events = function () {
            $(parentid).find('a').on('click', function (ev) {
               ev.preventDefault();
               var atag = $(this), childsub = atag.next(vars.listsub);
               //console.log(atag.text());
               if (childsub && opt.multipletab == true) {
                  if (childsub.hasClass(vars.showclass)) {
                     childsub.removeClass(vars.showclass).slideUp(500);
                  } else {
                     childsub.addClass(vars.showclass).slideDown(500);
                  }
               }
               if (childsub && opt.multipletab == false) {
                  childsub.siblings(vars.listsub).removeClass(vars.showclass).slideUp(500);
                  if (childsub.hasClass(vars.showclass)) {
                     childsub.removeClass(vars.showclass).slideUp(500);
                  } else {
                     childsub.addClass(vars.showclass).slideDown(500);
                  }
               }
            });
         },
         init = function (options) {//initials
            if (options) {
               opt = options;
               parentid = '#' + options.id;
               //test();
               events();
            } else { alert('no options'); }
         }

      return { init: init };
   })();

   multisidetabs.init({
      "id": "mg-multisidetabs",
      "multipletab": false
   });

});












jQuery(document).ready(function ($) {
   var galleryItems = $('.cd-gallery').children('li');

   galleryItems.each(function () {
      var container = $(this),
         // create slider dots
         sliderDots = createSliderDots(container);
      //check if item is on sale
      updatePrice(container, 0);

      // update slider when user clicks one of the dots
      sliderDots.on('click', function () {
         var selectedDot = $(this);
         if (!selectedDot.hasClass('selected')) {
            var selectedPosition = selectedDot.index(),
               activePosition = container.find('.cd-item-wrapper .selected').index();
            if (activePosition < selectedPosition) {
               nextSlide(container, sliderDots, selectedPosition);
            } else {
               prevSlide(container, sliderDots, selectedPosition);
            }

            updatePrice(container, selectedPosition);
         }
      });

      // update slider on swipeleft
      container.find('.cd-item-wrapper').on('swipeleft', function () {
         var wrapper = $(this);
         if (!wrapper.find('.selected').is(':last-child')) {
            var selectedPosition = container.find('.cd-item-wrapper .selected').index() + 1;
            nextSlide(container, sliderDots);
            updatePrice(container, selectedPosition);
         }
      });

      // update slider on swiperight
      container.find('.cd-item-wrapper').on('swiperight', function () {
         var wrapper = $(this);
         if (!wrapper.find('.selected').is(':first-child')) {
            var selectedPosition = container.find('.cd-item-wrapper .selected').index() - 1;
            prevSlide(container, sliderDots);
            updatePrice(container, selectedPosition);
         }
      });

      // preview image hover effect - desktop only
      container.on('mouseover', '.move-right, .move-left', function (event) {
         hoverItem($(this), true);
      });
      container.on('mouseleave', '.move-right, .move-left', function (event) {
         hoverItem($(this), false);
      });

      // update slider when user clicks on the preview images
      container.on('click', '.move-right, .move-left', function (event) {
         event.preventDefault();
         if ($(this).hasClass('move-right')) {
            var selectedPosition = container.find('.cd-item-wrapper .selected').index() + 1;
            nextSlide(container, sliderDots);
         } else {
            var selectedPosition = container.find('.cd-item-wrapper .selected').index() - 1;
            prevSlide(container, sliderDots);
         }
         updatePrice(container, selectedPosition);
      });
   });

   function createSliderDots(container) {
      var dotsWrapper = $('<ol class="cd-dots"></ol>').insertAfter(container.children('a'));
      container.find('.cd-item-wrapper li').each(function (index) {
         var dotWrapper = (index == 0) ? $('<li class="selected"></li>') : $('<li></li>'),
            dot = $('<a href="#0"></a>').appendTo(dotWrapper);
         dotWrapper.appendTo(dotsWrapper);
         dot.text(index + 1);
      });
      return dotsWrapper.children('li');
   }

   function hoverItem(item, bool) {
      (item.hasClass('move-right'))
         ? item.toggleClass('hover', bool).siblings('.selected, .move-left').toggleClass('focus-on-right', bool)
         : item.toggleClass('hover', bool).siblings('.selected, .move-right').toggleClass('focus-on-left', bool);
   }

   function nextSlide(container, dots, n) {
      var visibleSlide = container.find('.cd-item-wrapper .selected'),
         navigationDot = container.find('.cd-dots .selected');
      if (typeof n === 'undefined') n = visibleSlide.index() + 1;
      visibleSlide.removeClass('selected');
      container.find('.cd-item-wrapper li').eq(n).addClass('selected').removeClass('move-right hover').prevAll().removeClass('move-right move-left focus-on-right').addClass('hide-left').end().prev().removeClass('hide-left').addClass('move-left').end().next().addClass('move-right');
      navigationDot.removeClass('selected')
      dots.eq(n).addClass('selected');
   }

   function prevSlide(container, dots, n) {
      var visibleSlide = container.find('.cd-item-wrapper .selected'),
         navigationDot = container.find('.cd-dots .selected');
      if (typeof n === 'undefined') n = visibleSlide.index() - 1;
      visibleSlide.removeClass('selected focus-on-left');
      container.find('.cd-item-wrapper li').eq(n).addClass('selected').removeClass('move-left hide-left hover').nextAll().removeClass('hide-left move-right move-left focus-on-left').end().next().addClass('move-right').end().prev().removeClass('hide-left').addClass('move-left');
      navigationDot.removeClass('selected');
      dots.eq(n).addClass('selected');
   }

   function updatePrice(container, n) {
      var priceTag = container.find('.cd-price'),
         selectedItem = container.find('.cd-item-wrapper li').eq(n);
      if (selectedItem.data('sale')) {
         // if item is on sale - cross old price and add new one
         priceTag.addClass('on-sale');
         var newPriceTag = (priceTag.next('.cd-new-price').length > 0) ? priceTag.next('.cd-new-price') : $('<em class="cd-new-price"></em>').insertAfter(priceTag);
         newPriceTag.text(selectedItem.data('price'));
         setTimeout(function () { newPriceTag.addClass('is-visible'); }, 100);
      } else {
         // if item is not on sale - remove cross on old price and sale price
         priceTag.removeClass('on-sale').next('.cd-new-price').removeClass('is-visible').on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function () {
            priceTag.next('.cd-new-price').remove();
         });
      }
   }
});
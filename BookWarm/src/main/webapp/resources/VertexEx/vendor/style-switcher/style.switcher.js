; (function ($) {
var styleSwitcher = {
   initialized: !1,
   defaults: {
      saveToStorage: !0,
      preserveCookies: !1,
      colorPrimary: "#0cb4ce",  
      colorAlternateBG: "#fafafa", 
      colorMainBG: "#ffffff",
      colorBorder: "#e8e8e8",
      borderRadius: "4px",
      layoutStyle: "wide",
      menuDrapdownColor: "menu-dropdown-color-light",
      websiteType: "normal",
      backgroundColor: "light",
      backgroundPattern: "",
      changeLogo: !0,
      showSwitcher: !1,
      menuFontSize: "14px",
      menuDropdownFontSize: "13px",
      menuTextTransform: "none",
      headingsTextTransform: "none",
      bodyFontSize: "13px",
      bodyLineHeight: "21px"
   },

   initialize: function () { 
      var a = this
         , b = $("html").data("style-switcher-options")
         , c = $("#styleSwitcherScript").data("base-path") ? $("#styleSwitcherScript").data("base-path") : ""
         , d = $("head")
         , e = $("#styleSwitcherScript").data("skin-src") ? $("#styleSwitcherScript").data("skin-src") : c + "vendor/style-switcher/skin-default.less";
      if (a.basePath = c,
         !this.initialized) {
         if (a.options = $.extend({}, a.defaults),
            String.prototype.capitalize = function () {
               return this.charAt(0).toUpperCase() + this.slice(1)
            }
            ,
            jQuery.styleSwitcherCachedScript = function (a, b) {
               return b = $.extend(b || {}, {
                  dataType: "script",
                  cache: !0,
                  url: a
               }),
                  jQuery.ajax(b)
            }
            ,
            null != $.cookie("borderRadius") && (a.options.borderRadius = $.cookie("borderRadius")),
            null != $.cookie("colorPrimary") && (a.options.colorPrimary = "#" + $.cookie("colorPrimary")),
            null != $.cookie("colorAlternateBG") && (a.options.colorAlternateBG = "#" + $.cookie("colorAlternateBG")),
            null != $.cookie("colorMainBG") && (a.options.colorMainBG = "#" + $.cookie("colorMainBG")),
            null != $.cookie("colorBorder") && (a.options.colorBorder = "#" + $.cookie("colorBorder")),
            null != $.cookie("menuFontSize") && (a.options.menuFontSize = $.cookie("menuFontSize")),
            null != $.cookie("bodyFontSize") && (a.options.bodyFontSize = $.cookie("bodyFontSize")),
            null != $.cookie("bodyLineHeight") && (a.options.bodyLineHeight = $.cookie("bodyLineHeight")),
            null != $.cookie("menuDropdownFontSize") && (a.options.menuDropdownFontSize = $.cookie("menuDropdownFontSize")),
            null != $.cookie("menuTextTransform") && (a.options.menuTextTransform = $.cookie("menuTextTransform")),
            null != $.cookie("headingsTextTransform") && (a.options.headingsTextTransform = $.cookie("headingsTextTransform")),
            b && (b = b.replace(/'/g, '"'),
               a.options = $.extend({}, a.options, JSON.parse(b)),
               a.options.preserveCookies = !0,
               a.options.saveToStorage = !1),
            d.append($('<link rel="stylesheet">').attr("href", c + "vendor/style-switcher/style-switcher.css")),
            null == $.cookie("showSwitcher") && !a.options.showSwitcher && $.cookie("initialized"))
            return void a.initializeSimpleMode();
         d.append($('<link rel="stylesheet/less">').attr("href", e)),
            d.append($('<link rel="stylesheet">').attr("href", c + "vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css")),
            $.styleSwitcherCachedScript(c + "vendor/style-switcher/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js").done(function (d, e) {
               less = {
                  async: !0,
                  env: "production",
                  modifyVars: {
                     "@border-radius": a.options.borderRadius,
                     "@color_primary": a.options.colorPrimary,
                     "@color-alternate-bg": a.options.colorAlternateBG,
                     "@color-main-bg": a.options.colorMainBG,
                     "@color-border": a.options.colorBorder,
                     "@menu-font-size": a.options.menuFontSize,
                     "@body-font-size": a.options.bodyFontSize,
                     "@body-line-height": a.options.bodyLineHeight,
                     "@menu-dropdown-font-size": a.options.menuDropdownFontSize,
                     "@menu-text-transform": a.options.menuTextTransform,
                     "@headings-text-transform": a.options.headingsTextTransform
                  }
               },
                  $.styleSwitcherCachedScript(c + "vendor/style-switcher/less.js").done(function (d, e) {
                     $.ajax({
                        url: c + "vendor/style-switcher/style.switcher.html"
                     }).done(function (c) {
                        $("body").append(c),
                           a.container = $("#styleSwitcher"),
                           a.build(),
                           a.events(),
                           "img/logo.png" != $("#header .header-logo img").attr("src") && (a.options.changeLogo = !1),
                           b || (null != $.cookie("layoutStyle") && (a.options.layoutStyle = $.cookie("layoutStyle")),
                           null != $.cookie("menuDrapdownColor") && (a.options.menuDrapdownColor = $.cookie("menuDrapdownColor")),
                              $("body").hasClass("one-page") && (a.options.websiteType = "one-page"),
                           null != $.cookie("backgroundColor") && (a.options.backgroundColor = $.cookie("backgroundColor")),
                              null != $.cookie("backgroundPattern") && (a.options.backgroundPattern = $.cookie("backgroundPattern"))),
                           a.setLayoutStyle(a.options.layoutStyle),
                           a.setMenuDrapdownColor(a.options.menuDrapdownColor),
                           a.setWebsiteType(a.options.websiteType),
                           a.setBackgroundColor(a.options.backgroundColor),
                           a.setBackgroundPattern(a.options.backgroundPattern),
                           a.setColors(),
                           a.setBorderRadius(a.options.borderRadius),
                           a.setMenuFontSize(a.options.menuFontSize),
                           a.setBodyFontSize(a.options.bodyFontSize),
                           a.setMenuDropdownFontSize(a.options.menuDropdownFontSize),
                           a.setMenuTextTransform(a.options.menuTextTransform),
                           a.setHeadingsTextTransform(a.options.headingsTextTransform),
                           $("#styleSwitcherSimple").remove(),
                           a.initialized = !0,
                           null == $.cookie("initialized") && $.cookie("initialized", !0),
                           $(".xdemo-layout").val($.cookie("layoutStyle")),
                           $(".xmenu-dropdown-color").val($.cookie("menuDrapdownColor")),
                           $(".menu-font-size").val($.cookie("menuFontSize")),
                           $(".body-font-size").val($.cookie("bodyFontSize")),
                           $(".menu-dropdown-font-size").val($.cookie("menuDropdownFontSize")),
                           $(".menu-text-transform").val($.cookie("menuTextTransform")),
                           $(".headings-text-transform").val($.cookie("headingsTextTransform"))
                     })
                  })
            }),
            $.styleSwitcherCachedScript(c + "vendor/style-switcher/cssbeautify/cssbeautify.js").done(function (a, b) { })
      }
   },

   initializeSimpleMode: function () {
      var a = this
         , b = $("#header .header-logo img")
         , c = $("#header .header-logo img").attr("src")
         , d = '<div id="styleSwitcherSimple" class="style-switcher style-switcher-simple hidden-xs"><a id="styleSwitcherSimpleOpen" class="style-switcher-open" href="#"><i class="fa fa-cogs"></i></a></div>';
      $("body").append(d),
         "img/logo.png" == c,
         $("#styleSwitcherSimpleOpen").on("click", function (d) {
            d.preventDefault(),
               b.attr("src", c),
               $(this).find(".fa").removeClass().addClass("fa fa-cog fa-spin fa-fw"),
               $.cookie("showSwitcher", !0),
               a.initialized = !1,
               a.initialize()
         });
   },

   // build
   build: function () {      
      var a = this
         , b = a.container.find(".color_primary input")
         , c = a.container.find(".color-alternate-bg input")
         , d = a.container.find(".color-main-bg input")
         , e = a.container.find(".color-border input");
      b.val(a.options.colorPrimary).parent().colorpicker(),
         c.val(a.options.colorAlternateBG).parent().colorpicker(),
         d.val(a.options.colorMainBG).parent().colorpicker(),
         e.val(a.options.colorBorder).parent().colorpicker(),
         $(".colorpicker").on("mousedown", function (b) {
            b.preventDefault(),
               a.isChanging = !0
         }).on("mouseup", function (f) {
            f.preventDefault(),
               a.isChanging = !1,
               a.options.colorPrimary = b.val(),
               a.options.colorAlternateBG = c.val(),
               a.options.colorMainBG = d.val(),
               a.options.colorBorder = e.val(),
               a.setColors()
         }),
         $(".colorpicker-element input").on("blur", function (f) {
            a.options.colorPrimary = b.val(),
               a.options.colorAlternateBG = c.val(),
               a.options.colorMainBG = d.val(),
               a.options.colorBorder = e.val(),
               a.setColors()
         }),
         this.container.find(".options-links.borders a").on("click", function (b) {
            b.preventDefault(),
               a.setBorderRadius($(this).attr("data-border-radius"))
         }),
         this.container.find(".options-links.layout a").on("click", function (b) {
            b.preventDefault(),
               a.setLayoutStyle($(this).attr("data-layout-type"), !0)
         }),
         this.container.find(".xdemo-layout").on("change", function () {
            a.setLayoutStyle($(this).find(":selected").val(), !0)
         }),
         this.container.find(".xmenu-dropdown-color").on("change", function () {
            a.setMenuDrapdownColor($(this).find(":selected").val(), !0)
         }),



         this.container.find(".menu-font-size").on("change", function () {
            a.setMenuFontSize($(this).find(":selected").val())
         }),
         this.container.find(".menu-dropdown-font-size").on("change", function () {
            a.setMenuDropdownFontSize($(this).find(":selected").val())
         }),
         this.container.find(".menu-text-transform").on("change", function () {
            a.setMenuTextTransform($(this).find(":selected").val())
         }),
         this.container.find(".headings-text-transform").on("change", function () {
            a.setHeadingsTextTransform($(this).find(":selected").val())
         }),
         this.container.find(".body-font-size").on("change", function () {
            a.setBodyFontSize($(this).find(":selected").val())
         }),




         this.container.find(".options-links.website-type a").on("click", function (a) {
            a.preventDefault(),
               $.cookie("showSwitcher", !0),
               self.location = $(this).attr("href")
         }),
         this.container.find(".options-links.background-color a").on("click", function (b) {
            b.preventDefault(),
               a.setBackgroundColor($(this).attr("data-background-color"))
         });
      var f = this.container.find("ul[data-type=patterns]");
      f.find("a").on("click", function (b) {
         b.preventDefault(),
            a.setBackgroundPattern($(this).attr("data-pattern"))
      }),
         a.container.find(".reset").on("click", function (b) {
            b.preventDefault(),
               a.reset()
         }),
         a.container.find(".get-css").on("click", function (b) {
            b.preventDefault(),
               a.getCss()
         })
   },

   // events
   events: function () {
      var a = this;
      $("#styleSwitcherOpen").on("click", function (b) {
         b.preventDefault(),
            a.container.toggleClass("active")
      }),
         (null != $.cookie("showSwitcher") || $("body").hasClass("one-page")) && ($("#styleSwitcherOpen").trigger("click"),
            $.removeCookie("showSwitcher"))
   },

   // setColors
   setColors: function (a, b) {
      var c = this;
      return this.isChanging ? !1 : (a && (c.options["color" + b.capitalize()] = a,
         c.container.find(".color-" + b + " input").val(a)),
         c.options.preserveCookies || ($.cookie("colorPrimary", c.options.colorPrimary.replace("#", ""))),
         c.modifyVars())
   },

   // setBorderRadius
   setBorderRadius: function (a) {
      var b = this;
      b.options.borderRadius = a,
         b.options.preserveCookies || $.cookie("borderRadius", a),
         b.modifyVars();
      var c = this.container.find(".options-links.borders");
      c.find(".active").removeClass("active"),
         c.find("a[data-border-radius=" + a + "]").addClass("active"),
         $.event.trigger({
            type: "styleSwitcher.setBorderRadius",
            radius: a
         })
   },
   
   // setLayoutStyle
   setLayoutStyle: function (a, b) {
      var c = this;
      if ($("body").hasClass("one-page"))
         return !1;
      if (c.options.preserveCookies || $.cookie("layoutStyle", a),
         this.options.saveToStorage && "undefined" != typeof localStorage && localStorage.setItem("layout", a),
         b)
         return $.cookie("showSwitcher", !0),
            window.location.reload(),
            !1;

      var body = $('html');
      var patterns = this.container.find(".patterns");

      if (a === 'wide') {
         body.removeClass('boxed-layout');
         patterns.hide();
      } else if (a === 'boxed-layout') {
         body.removeClass('boxed-layout');
         body.addClass('boxed-layout');
         patterns.show();
      } else if (a === 'boxed-layout-2') {
         body.removeClass('boxed-layout boxed-layout-2');
         body.addClass('boxed-layout boxed-layout-2');
         patterns.show();
      }


      //var d = this.container.find(".options-links.layout")
      //   , e = this.container.find(".patterns");
      //d.find(".active").removeClass("active"),
      //   d.find("a[data-layout-type=" + a + "]").addClass("active"),
      //   "wide" == a ? (e.hide(),
      //      $("html").removeClass("boxed"),
      //      $.removeCookie("backgroundPattern")) : (e.show(),
      //         $("html").addClass("boxed"),
      //         null == $.cookie("backgroundPattern") && this.container.find("ul[data-type=patterns] li:first a").trigger("click")),
      //   $.event.trigger({
      //      type: "styleSwitcher.setLayoutStyle",
      //      style: a
      //   })
   },


   // setMenuDrapdownColor
   setMenuDrapdownColor: function (a, b) {
      var c = this; 
      if (c.options.preserveCookies || $.cookie("menuDrapdownColor", a),
         this.options.saveToStorage && "undefined" != typeof localStorage && localStorage.setItem("menuDrapdownColor", a),
         b)
         return $.cookie("showSwitcher", !0),
            window.location.reload(),
            !1;

      var header = $('header .l-navbar'); 

      if (a === 'menu-dropdown-color-light') {
         header.removeClass('l-navbar_black_dropdown'); 
      } else if (a === 'menu-dropdown-color-dark') {
         header.removeClass('l-navbar_black_dropdown');
         header.addClass('l-navbar_black_dropdown'); 
      } 
   },


   // setMenuFontSize
   setMenuFontSize: function (a) {
      var b = this;
      b.options.menuFontSize = a,
         b.options.preserveCookies || $.cookie("menuFontSize", a),
         b.modifyVars();
      $.event.trigger({
         type: "styleSwitcher.setMenuFontSize",
         radius: a
      })
   },


   // setMenuDropdownFontSize
   setMenuDropdownFontSize: function (a) {
      var b = this;
      b.options.menuDropdownFontSize = a,
         b.options.preserveCookies || $.cookie("menuDropdownFontSize", a),
         b.modifyVars();
      $.event.trigger({
         type: "styleSwitcher.setMenuDropdownFontSize",
         radius: a
      })
   },



   // setBodyFontSize
   setBodyFontSize: function (a) {
      var b = this;

      var lineHeight = "21px";
      if (a == '13px') {
         lineHeight = '21px';
      } else if (a == '14px') {
         lineHeight = '23px';
      } else if (a == '15px') {
         lineHeight = '24px';
      } else if (a == '16px') {
         lineHeight = '24px';
      } else if (a == '17px') {
         lineHeight = '25px';
      } else if (a == '18px') {
         lineHeight = '27px';
      } else if (a == '12px') {
         lineHeight = '18px';
      }
      
      b.options.bodyLineHeight = lineHeight,
      b.options.bodyFontSize = a,
         b.options.preserveCookies || $.cookie("bodyFontSize", a),
         b.options.preserveCookies || $.cookie("bodyLineHeight", lineHeight),
         b.modifyVars();
      $.event.trigger({
         type: "styleSwitcher.setBodyFontSize",
         radius: a
      })
   },



   // setMenuTextTransform
   setMenuTextTransform: function (a) {
      var b = this;
      b.options.menuTextTransform = a,
         b.options.preserveCookies || $.cookie("menuTextTransform", a),
         b.modifyVars();
      $.event.trigger({
         type: "styleSwitcher.setMenuTextTransform",
         radius: a
      })
   },


   // setHeadingsTextTransform
   setHeadingsTextTransform: function (a) {
      var b = this;
      b.options.headingsTextTransform = a,
         b.options.preserveCookies || $.cookie("headingsTextTransform", a),
         b.modifyVars();
      $.event.trigger({
         type: "styleSwitcher.setHeadingsTextTransform",
         radius: a
      })
   },





   // setWebsiteType
   setWebsiteType: function (a) {
      var b = this.container.find(".options-links.website-type")
         , c = this.container.find(".options-links.layout");
      "one-page" == a ? (b.find("a:last").addClass("active"),
         c.prev().remove(),
         c.remove()) : b.find("a:first").addClass("active")
   },

   // setBackgroundColor
   setBackgroundColor: function (a) {
      var b = this;
      b.options.preserveCookies || $.cookie("backgroundColor", a);
      var c = this.container.find(".options-links.background-color");
      c.find(".active").removeClass("active"),
         c.find("a[data-background-color=" + a + "]").addClass("active"),
         "dark" == a ? $("html").addClass("dark") : $("html").removeClass("dark"),
         $.event.trigger({
            type: "styleSwitcher.setBackgroundColor",
            color: a
         })
   },

   // setBackgroundPattern
   setBackgroundPattern: function (a) {
      var b = this;
      if ("" == a)
         return this;
      var c = $("html").hasClass("boxed-layout") || $("html").hasClass("boxed-layout-2");
      c && $("html").css("background-image", "url(img/patterns/" + a + ".png)"),
         b.options.preserveCookies || $.cookie("backgroundPattern", a),
         $.event.trigger({
            type: "styleSwitcher.setBackgroundPattern",
            pattern: a
         })
   }, 

   // modifyVars
   modifyVars: function () {
      var a = this;
      window.clearTimeout(a.timer),
         a.timer = window.setTimeout(function () {
            less.modifyVars({
               "@border-radius": a.options.borderRadius,
               "@color_primary": a.options.colorPrimary,
               "@color-alternate-bg": a.options.colorAlternateBG,
               "@color-main-bg": a.options.colorMainBG,
               "@color-border": a.options.colorBorder,
               "@menu-font-size": a.options.menuFontSize,
               "@body-font-size": a.options.bodyFontSize,
               "@body-line-height": a.options.bodyLineHeight,
               "@menu-text-transform": a.options.menuTextTransform,
               "@headings-text-transform": a.options.headingsTextTransform,
               "@menu-dropdown-font-size": a.options.menuDropdownFontSize
            }),
               a.options.saveToStorage && "undefined" != typeof localStorage && localStorage.setItem("skin.css", $('style[id^="less:"]').text())
         }, 300)
   },

   // reset
   reset: function () {
      $.removeCookie("borderRadius"),
         $.removeCookie("colorPrimary"),
         $.removeCookie("colorAlternateBG"),
         $.removeCookie("colorMainBG"),
         $.removeCookie("colorBorder"),
         $.removeCookie("layoutStyle"),
         $.removeCookie("menuDrapdownColor"),
         $.removeCookie("backgroundColor"),
         $.removeCookie("backgroundPattern"),
         $.removeCookie("menuTextTransform"),
         $.removeCookie("headingsTextTransform"),
         $.removeCookie("menuDropdownFontSize"),
         $.removeCookie("bodyFontSize"),
         $.removeCookie("bodyLineHeight"),
         $.removeCookie("menuFontSize"),
         $.cookie("showSwitcher", !0),
         window.location.reload(),
         "undefined" != typeof localStorage && (localStorage.removeItem("skin.css"),
            localStorage.removeItem("layout"))
   },

   // getCss
   getCss: function () {
      raw = "";
      var a = $("html").hasClass("boxed");
      a ? (raw = 'html { background-image: url("../../img/patterns/' + $.cookie("backgroundPattern") + '.png"); }',
         $("#addBoxedClassInfo").show()) : $("#addBoxedClassInfo").hide(),
         $("#getCSSTextarea").text($('style[id^="less:"]').text()).focus(function () {
            var a = $(this);
            a.select(),
               a.mouseup(function () {
                  return a.unbind("mouseup"),
                     !1
               })
         }),
         $("#getCSSModal").modal("show"),
         options = {
            indent: "	",
            autosemicolon: !0
         },
         raw += $("#getCSSTextarea").text(),
         $("#getCSSTextarea").text(cssbeautify(raw, options))
   }
};
styleSwitcher.initialize();
})(jQuery);